class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.integer :receiver_id
      t.integer :receiver_time_id
      t.integer :offset_time_id
      t.integer :channel_status_id
      t.integer :signal_type_id
      t.integer :transmitter_id
      t.float :apparent_doppler
      t.float :beat_carrier_phase
      t.float :pseudorange
      t.float :carrier_to_noise_ratio
      t.boolean :is_valid_pseudorange_and_phase
      t.boolean :is_anomaly_detected

      t.timestamps
    end
    add_index :channels, [:receiver_id, :offset_time_id, :signal_type_id, :transmitter_id], :name => 'channels_unique_values', :unique => true
  end
end
