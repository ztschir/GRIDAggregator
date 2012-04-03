class CreateTransmitters < ActiveRecord::Migration
  def change
    create_table :transmitters do |t|
      t.integer :receiverID
      t.integer :offsetTimeID
      t.float :azmiuth
      t.float :elevation
      t.integer :healthStatusID
      t.integer :transmitterSystemID
      t.integer :transmitterID

      t.timestamps
    end
  end
end
