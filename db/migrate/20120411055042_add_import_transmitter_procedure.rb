class AddImportTransmitterProcedure < ActiveRecord::Migration
    def up
      execute('DROP PROCEDURE IF EXISTS `importTransmitterData`')

      sql = <<-SQL
      CREATE PROCEDURE `importTransmitterData`()
      BEGIN

      		INSERT INTO receivers (id)
      		SELECT transmitter_imports.receiver_id as id
      		FROM transmitter_imports
      		LEFT JOIN receivers on transmitter_imports.receiver_id = receivers.id
      		WHERE receivers.id is NULL
      		GROUP BY transmitter_imports.receiver_id;

              INSERT INTO offset_times (offset_week_number, offset_whole_seconds_of_week, offset_fractional_second)
              SELECT transmitter_imports.offset_week_number, 
              	transmitter_imports.offset_whole_seconds_of_week, transmitter_imports.offset_fractional_second
              FROM transmitter_imports
              ON DUPLICATE KEY UPDATE offset_times.id = offset_times.id;             

              INSERT INTO transmitters (receiver_id, offset_time_id, azmiuth, elevation, 
              	health_status_id, transmitter_system_id, transmitter_id, created_at, updated_at)
              SELECT transmitter_imports.receiver_id, offset_times.id as offset_time_id, 
              						transmitter_imports.azmiuth, transmitter_imports.elevation, 
              						transmitter_imports.health_status_id, 
              						transmitter_imports.transmitter_system_id, transmitter_imports.transmitter_id,
        								CURRENT_TIMESTAMP() as created_at, CURRENT_TIMESTAMP() as updated_at
              FROM transmitter_imports
              JOIN offset_times on offset_times.offset_week_number = transmitter_imports.offset_week_number 
              		AND offset_times.offset_whole_seconds_of_week = transmitter_imports.offset_whole_seconds_of_week 
              		AND offset_times.offset_fractional_second = transmitter_imports.offset_fractional_second
              ON DUPLICATE KEY UPDATE transmitters.id = transmitters.id;

              TRUNCATE TABLE transmitter_imports;
        END
      SQL

      execute sql
    end
    

    def down
      execute('DROP PROCEDURE IF EXISTS `importTransmitterData`')
    end

end
