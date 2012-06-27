class AddImportChannelProcedure < ActiveRecord::Migration
  
  def up
    execute('DROP PROCEDURE IF EXISTS `importChannelData`')
    
    sql = <<-SQL
    CREATE PROCEDURE `importChannelData`()
    BEGIN

    		INSERT INTO receivers (id)
    		SELECT channel_imports.receiver_id as id
    		FROM channel_imports
    		LEFT JOIN receivers on channel_imports.receiver_id = receivers.id
    		WHERE receivers.id is NULL
    		GROUP BY channel_imports.receiver_id;

            INSERT INTO offset_times (offset_week_number, offset_whole_seconds_of_week, offset_fractional_second)
            SELECT channel_imports.offset_week_number, channel_imports.offset_whole_seconds_of_week, channel_imports.offset_fractional_second
            FROM channel_imports
            ON DUPLICATE KEY UPDATE offset_times.id = offset_times.id;

            INSERT INTO receiver_times (receiver_week_number, receiver_seconds_of_week)
            SELECT channel_imports.receiver_week_number, channel_imports.receiver_seconds_of_week
            FROM channel_imports
            ON DUPLICATE KEY UPDATE receiver_times.id = receiver_times.id;


            INSERT INTO channels (receiver_id, receiver_time_id, offset_time_id, 
            						channel_status_id, signal_type_id, transmitter_id, apparent_doppler, 
            						beat_carrier_phase, pseudorange, carrier_to_noise_ratio, is_valid_pseudorange_and_phase, 
            						is_anomaly_detected, created_at, updated_at)
            SELECT channel_imports.receiver_id, receiver_times.id as receiver_time_id, offset_times.id as offset_time_id, 
            						channel_imports.channel_status_id + 1 as channel_status_id, channel_imports.signal_type_id + 1 as signal_type_id, channel_imports.transmitter_id,
            						channel_imports.apparent_doppler, channel_imports.beat_carrier_phase, channel_imports.pseudorange, 
            						channel_imports.carrier_to_noise_ratio, channel_imports.is_valid_pseudorange_and_phase, 
            						channel_imports.is_anomaly_detected, CURRENT_TIMESTAMP() as created_at, CURRENT_TIMESTAMP() as updated_at
            FROM channel_imports
            JOIN offset_times on offset_times.offset_week_number = channel_imports.offset_week_number 
            		AND offset_times.offset_whole_seconds_of_week = channel_imports.offset_whole_seconds_of_week 
            		AND offset_times.offset_fractional_second = channel_imports.offset_fractional_second
            JOIN receiver_times on receiver_times.receiver_week_number = channel_imports.receiver_week_number
            		AND receiver_times.receiver_seconds_of_week = channel_imports.receiver_seconds_of_week
            ON DUPLICATE KEY UPDATE channels.id = channels.id;

            TRUNCATE TABLE channel_imports;
      END
    SQL

    execute sql
  end
  def down
    execute('DROP PROCEDURE IF EXISTS `importChannelData`')
  end
end
