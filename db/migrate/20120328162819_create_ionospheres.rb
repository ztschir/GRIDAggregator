class CreateIonospheres < ActiveRecord::Migration
  def change
    create_table :ionospheres do |t|
      t.integer :receiverID
      t.integer :offsetTimeID
      t.float :pseudorangeDerivedSTEC
      t.float :pseudorangeDerivedSTECDot
      t.integer :transmitterID

      t.timestamps
    end
    add_index :ionospheres, [:receiverID, :offsetTimeID, :transmitterID], :name => 'ionospheres_unique_values', :unique => true
  end
end
