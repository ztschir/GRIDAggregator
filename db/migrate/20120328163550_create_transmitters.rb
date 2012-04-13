class CreateTransmitters < ActiveRecord::Migration
  def change
    create_table :transmitters do |t|
      t.integer :receiver_id
      t.integer :offset_time_id
      t.float :azmiuth
      t.float :elevation
      t.integer :health_status_id
      t.integer :transmitter_system_id
      t.integer :transmitter_id

      t.timestamps
    end
    add_index :transmitters, [:receiver_id, :offset_time_id, :transmitter_system_id, :transmitter_id], :name => 'transmitter_unique_values', :unique => true
  end
end
