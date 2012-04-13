class CreateIonospheres < ActiveRecord::Migration
  def change
    create_table :ionospheres do |t|
      t.integer :receiver_id
      t.integer :offset_time_id
      t.float :pseudorange_derived_stec
      t.float :pseudorange_derived_stec_dot
      t.integer :transmitter_id

      t.timestamps
    end
    add_index :ionospheres, [:receiver_id, :offset_time_id, :transmitter_id], :name => 'ionospheres_unique_values', :unique => true
  end
end
