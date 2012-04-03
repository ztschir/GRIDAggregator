class CreateReceiverTimes < ActiveRecord::Migration
  def change
    create_table :receiver_times do |t|
      t.integer :receiverWeekNumber
      t.float :receiverSecondsOfWeek

      t.timestamps
    end
  end
end
