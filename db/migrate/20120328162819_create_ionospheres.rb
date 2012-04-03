class CreateIonospheres < ActiveRecord::Migration
  def change
    create_table :ionospheres do |t|
      t.integer :offsetTimeID
      t.float :pseudorangeDerivedSTEC
      t.float :pseudorangeDerivedSTECDot
      t.integer :transmitterID

      t.timestamps
    end
  end
end
