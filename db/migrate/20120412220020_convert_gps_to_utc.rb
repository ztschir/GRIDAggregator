class ConvertGpsToUtc < ActiveRecord::Migration
  def up
    execute('DROP PROCEDURE IF EXISTS `convertGpsToUtc`')

    sql = <<-SQL
    CREATE PROCEDURE `convertGpsToUtc`()
      BEGIN

      CREATE TEMPORARY TABLE tmp ENGINE=MEMORY
      SELECT offset_times.id, DATE_ADD('1980-01-06',INTERVAL offset_week_number WEEK) as date_in_utc, count(*) as number_of_leap_seconds
      FROM offset_times
      JOIN leap_seconds ON DATE_ADD('1980-01-06',INTERVAL offset_week_number WEEK) > leap_seconds.date
      WHERE offset_times.utc_time IS NULL
      GROUP BY offset_times.id, DATE_ADD('1980-01-06',INTERVAL offset_week_number WEEK);

      UPDATE offset_times, tmp SET offset_times.utc_time = DATE_ADD(DATE_ADD(tmp.date_in_utc, INTERVAL offset_times.offset_whole_seconds_of_week + tmp.number_of_leap_seconds SECOND), INTERVAL offset_times.offset_fractional_second*1000000 MICROSECOND)
      WHERE tmp.id = offset_times.id;
      
      DROP TABLE tmp;
      END
    SQL

    execute sql
  end
  

  def down
    execute('DROP PROCEDURE IF EXISTS `convertGpsToUtc`')
  end
end
