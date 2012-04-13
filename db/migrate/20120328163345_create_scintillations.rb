class CreateScintillations < ActiveRecord::Migration
  def change
    create_table :scintillations do |t|
      t.integer :receiver_id
      t.integer :offset_time_id
      t.float :measurement_interval_length
      t.float :s4_whole_interval
      t.float :s4_first_half_interval
      t.float :s4_second_half_interval
      t.float :sigma_phi_whole_interval
      t.float :sigma_phi_first_half_interval
      t.float :sigma_phi_second_half_interval
      t.float :tau0
      t.float :scintillation_power_ratio
      t.integer :reference_channel_indicator
      t.integer :signal_type_id
      t.integer :transmitter_id

      t.timestamps
    end
    add_index :scintillations, [:receiver_id, :offset_time_id, :signal_type_id, :transmitter_id], :name => 'scintillations_unique_values', :unique => true
    
  end
end
