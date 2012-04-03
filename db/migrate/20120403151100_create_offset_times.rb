class CreateOffsetTimes < ActiveRecord::Migration
  def change
    create_table :offset_times do |t|
      t.integer :offsetWeekNumber
      t.float :offsetWholeSecondsOfWeek
      t.float :offsetFractionalSecond

      t.timestamps
    end
  end
end
