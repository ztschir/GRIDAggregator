class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.integer :receiverID
      t.integer :receiverTimeID
      t.integer :offsetTimeID
      t.integer :channelStatusID
      t.integer :signalTypeID
      t.integer :transmitterID
      t.float :apperentDoppler
      t.float :beatCarrierPhase
      t.float :pseudorange
      t.float :carrierToNoiseRatio
      t.boolean :isValidPseudorangeAndPhase
      t.boolean :isAnomalyDetected

      t.timestamps
    end
  end
end
