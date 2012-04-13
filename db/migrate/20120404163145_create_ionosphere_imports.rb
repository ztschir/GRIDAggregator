class CreateIonosphereImports < ActiveRecord::Migration
  def change
    create_table :ionosphere_imports do |t|
      t.integer :receiver_id
      t.integer :offset_week_number
      t.integer :offset_whole_seconds_of_week
      t.float :offset_fractional_second
      t.float :pseudorange_derived_stec
      t.float :pseudorange_derived_stec_dot
      t.integer :transmitter_id

      t.timestamps
    end
  end
end
