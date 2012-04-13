class CreateChannelImports < ActiveRecord::Migration
  def change
    create_table :channel_imports do |t|
      t.integer :receiver_id
      t.integer :receiver_week_number
      t.float :receiver_seconds_of_week
      t.integer :offset_week_number
      t.integer :offset_whole_seconds_of_week
      t.float :offset_fractional_second
      t.float :apparent_doppler
      t.float :beat_carrier_phase
      t.float :pseudorange
      t.float :carrier_to_noise_ratio
      t.boolean :is_valid_pseudorange_and_phase
      t.boolean :is_anomaly_detected
      t.integer :channel_status_id
      t.integer :signal_type_id
      t.integer :transmitter_id

      t.timestamps
    end
  end
end
