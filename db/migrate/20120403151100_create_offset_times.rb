class CreateOffsetTimes < ActiveRecord::Migration
  def change
    create_table :offset_times do |t|
      t.integer :offset_week_number
      t.integer :offset_whole_seconds_of_week
      t.float :offset_fractional_second

      t.timestamps
    end
    add_index :offset_times, [:offset_week_number, :offset_whole_seconds_of_week, :offset_fractional_second], :name => 'offset_time_unique_values', :unique => true
  end
end
