class AddImportIonosphereProcedure < ActiveRecord::Migration

  def up
    execute('DROP PROCEDURE IF EXISTS `importIonosphereData`')
    
    sql = <<-SQL
    CREATE PROCEDURE `importIonosphereData`()
     BEGIN

     		INSERT INTO receivers (id)
     		SELECT ionosphere_imports.receiver_id as id
     		FROM ionosphere_imports
     		LEFT JOIN receivers on ionosphere_imports.receiver_id = receivers.id
     		WHERE receivers.id is NULL
     		GROUP BY ionosphere_imports.receiver_id;

             INSERT INTO offset_times (offset_week_number, offset_whole_seconds_of_week, offset_fractional_second)
             SELECT ionosphere_imports.offset_week_number, 
             	ionosphere_imports.offset_whole_seconds_of_week, ionosphere_imports.offset_fractional_second
             FROM ionosphere_imports
             ON DUPLICATE KEY UPDATE offset_times.id = offset_times.id;

             INSERT INTO ionospheres (receiver_id, offset_time_id, 
             						pseudorange_derived_stec, pseudorange_derived_stec_dot, transmitter_id, created_at, updated_at)
             SELECT ionosphere_imports.receiver_id, offset_times.id as offset_time_id, 
             						ionosphere_imports.pseudorange_derived_stec, ionosphere_imports.pseudorange_derived_stec_dot,
             						ionosphere_imports.transmitter_id, CURRENT_TIMESTAMP() as created_at, CURRENT_TIMESTAMP() as updated_at
             FROM ionosphere_imports
             JOIN offset_times on offset_times.offset_week_number = ionosphere_imports.offset_week_number 
             		AND offset_times.offset_whole_seconds_of_week = ionosphere_imports.offset_whole_seconds_of_week 
             		AND offset_times.offset_fractional_second = ionosphere_imports.offset_fractional_second
             ON DUPLICATE KEY UPDATE ionospheres.id = ionospheres.id;

             TRUNCATE TABLE ionosphere_imports;
      END
    SQL

    execute sql
  end

  def down
    execute('DROP PROCEDURE IF EXISTS `importIonosphereData`')
  end

end
