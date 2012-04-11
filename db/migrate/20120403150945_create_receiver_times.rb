class CreateReceiverTimes < ActiveRecord::Migration
  def change
    create_table :receiver_times do |t|
      t.integer :receiverWeekNumber
      t.float :receiverSecondsOfWeek

      t.timestamps
    end
    add_index :receiver_times, [:receiverWeekNumber, :receiverSecondsOfWeek], :name => 'receiver_time_unique_values', :unique => true
  end
end
