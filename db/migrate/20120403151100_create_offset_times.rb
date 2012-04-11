class CreateOffsetTimes < ActiveRecord::Migration
  def change
    create_table :offset_times do |t|
      t.integer :offsetWeekNumber
      t.integer :offsetWholeSecondsOfWeek
      t.float :offsetFractionalSecond

      t.timestamps
    end
    add_index :offset_times, [:offsetWeekNumber, :offsetWholeSecondsOfWeek, :offsetFractionalSecond], :name => 'offset_time_unique_values', :unique => true
  end
end
