class CreateReceiverTimes < ActiveRecord::Migration
  def change
    create_table :receiver_times do |t|
      t.integer :receiver_week_number
      t.float :receiver_seconds_of_week

      t.timestamps
    end
    add_index :receiver_times, [:receiver_week_number, :receiver_seconds_of_week], :name => 'receiver_time_unique_values', :unique => true
  end
end
