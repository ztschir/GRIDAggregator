class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.integer :receiverID
      t.integer :receiverTimeID
      t.integer :offsetTimeID
      t.integer :channelStatusID
      t.integer :signalTypeID
      t.integer :transmitterID
      t.float :apparentDoppler
      t.float :beatCarrierPhase
      t.float :pseudorange
      t.float :carrierToNoiseRatio
      t.boolean :isValidPseudorangeAndPhase
      t.boolean :isAnomalyDetected

      t.timestamps
    end
    add_index :channels, [:receiverID, :offsetTimeID, :signalTypeID, :transmitterID], :name => 'channels_unique_values', :unique => true
  end
end
