class AddImportScintillationProcedure < ActiveRecord::Migration

    def up
      execute('DROP PROCEDURE IF EXISTS `importScintillationData`')

      sql = <<-SQL
      CREATE PROCEDURE `importScintillationData`()
      BEGIN

      		INSERT INTO receivers (id)
      		SELECT scintillation_imports.receiver_id as id
      		FROM scintillation_imports
      		LEFT JOIN receivers on scintillation_imports.receiver_id = receivers.id
      		WHERE receivers.id is NULL
      		GROUP BY scintillation_imports.receiver_id;

              INSERT INTO offset_times (offset_week_number, offset_whole_seconds_of_week, offset_fractional_second)
              SELECT scintillation_imports.offset_week_number, 
              	scintillation_imports.offset_whole_seconds_of_week, scintillation_imports.offset_fractional_second
              FROM scintillation_imports
              ON DUPLICATE KEY UPDATE offset_times.id = offset_times.id;     

              INSERT INTO scintillations (receiver_id, offset_time_id, measurement_interval_length, s4_whole_interval, s4_first_half_interval, 
        									s4_second_half_interval, sigma_phi_whole_interval, sigma_phi_first_half_interval, 
        									sigma_phi_second_half_interval, tau0, scintillation_power_ratio, reference_channel_indicator,
        									signal_type_id, transmitter_id, created_at, updated_at)
              SELECT scintillation_imports.receiver_id, offset_times.id as offset_time_id, 
              						scintillation_imports.measurement_interval_length, scintillation_imports.s4_whole_interval, 
              						scintillation_imports.s4_first_half_interval, 
              						scintillation_imports.s4_second_half_interval, scintillation_imports.sigma_phi_whole_interval, 
              						scintillation_imports.sigma_phi_first_half_interval, scintillation_imports.sigma_phi_second_half_interval, 
              						scintillation_imports.tau0, scintillation_imports.scintillation_power_ratio, 
              						scintillation_imports.reference_channel_indicator,
        								scintillation_imports.signal_type_id, scintillation_imports.transmitter_id,
        								CURRENT_TIMESTAMP() as created_at, CURRENT_TIMESTAMP() as updated_at
              FROM scintillation_imports
              JOIN offset_times on offset_times.offset_week_number = scintillation_imports.offset_week_number 
              		AND offset_times.offset_whole_seconds_of_week = scintillation_imports.offset_whole_seconds_of_week 
              		AND offset_times.offset_fractional_second = scintillation_imports.offset_fractional_second
              ON DUPLICATE KEY UPDATE scintillations.id = scintillations.id;

              TRUNCATE TABLE scintillation_imports;
        END
      SQL

      execute sql
    end

    def down
      execute('DROP PROCEDURE IF EXISTS `importScintillationData`')
    end
end
