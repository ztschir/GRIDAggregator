class AddImportNavigationProcedure < ActiveRecord::Migration
    def up
      execute('DROP PROCEDURE IF EXISTS `importNavigationData`')
      
      sql = <<-SQL
      CREATE PROCEDURE `importNavigationData`()
      BEGIN

      		INSERT INTO receivers (id)
      		SELECT navigation_imports.receiver_id as id
      		FROM navigation_imports
      		LEFT JOIN receivers on navigation_imports.receiver_id = receivers.id
      		WHERE receivers.id is NULL
      		GROUP BY navigation_imports.receiver_id;

              INSERT INTO offset_times (offset_week_number, offset_whole_seconds_of_week, offset_fractional_second)
              SELECT navigation_imports.offset_week_number, 
              	navigation_imports.offset_whole_seconds_of_week, navigation_imports.offset_fractional_second
              FROM navigation_imports
              ON DUPLICATE KEY UPDATE offset_times.id = offset_times.id;     

              INSERT INTO navigation_solutions (receiver_id, offset_time_id, x_position, y_position, z_position, 
              						delta_receiver_clock_error, x_velocity, y_velocity, z_velocity, 
              						delta_receiver_clock_error_dot, navigation_solver_id,
              						created_at, updated_at)
              SELECT navigation_imports.receiver_id, offset_times.id as offset_time_id, 
              						navigation_imports.x_position, navigation_imports.y_position, navigation_imports.z_position, 
              						navigation_imports.delta_receiver_clock_error, navigation_imports.x_velocity, 
              						navigation_imports.y_velocity, navigation_imports.z_velocity, 
              						navigation_imports.delta_receiver_clock_error_dot, 
              						navigation_imports.navigation_solver_id + 1 as navigation_solver_id, CURRENT_TIMESTAMP() as created_at, 
              						CURRENT_TIMESTAMP() as updated_at
              FROM navigation_imports
              JOIN offset_times on offset_times.offset_week_number = navigation_imports.offset_week_number 
              		AND offset_times.offset_whole_seconds_of_week = navigation_imports.offset_whole_seconds_of_week 
              		AND offset_times.offset_fractional_second = navigation_imports.offset_fractional_second
              ON DUPLICATE KEY UPDATE navigation_solutions.id = navigation_solutions.id;

              TRUNCATE TABLE navigation_imports;
        END
      SQL

      execute sql
    end

    def down
      execute('DROP PROCEDURE IF EXISTS `importNavigationData`')
    end

end
