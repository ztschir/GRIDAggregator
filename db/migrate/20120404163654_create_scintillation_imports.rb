class CreateScintillationImports < ActiveRecord::Migration
  def change
    create_table :scintillation_imports do |t|
      t.integer :receiver_id
      t.integer :offset_week_number
      t.integer :offset_whole_seconds_of_week
      t.float :offset_fractional_second
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
  end
end
