class CreateTransmitterImports < ActiveRecord::Migration
  def change
    create_table :transmitter_imports do |t|
      t.integer :receiver_id
      t.integer :offset_week_number
      t.integer :offset_whole_seconds_of_week
      t.float :offset_fractional_second
      t.float :azmiuth
      t.float :elevation
      t.integer :health_status_id
      t.integer :transmitter_system_id
      t.integer :transmitter_id

      t.timestamps
    end
  end
end
