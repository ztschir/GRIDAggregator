class CreateScintillations < ActiveRecord::Migration
  def change
    create_table :scintillations do |t|
      t.integer :receiverID
      t.integer :offsetTimeID
      t.float :measurementIntervalLength
      t.float :s4WholeInterval
      t.float :s4FirstHalfInterval
      t.float :s4SecondHalfInterval
      t.float :sigmaPhiWholeInterval
      t.float :sigmaPhiFirstHalfInterval
      t.float :sigmaPhiSecondHalfInterval
      t.float :tau0
      t.float :scintillationPowerRatio
      t.integer :referenceChannelIndicator
      t.integer :signalTypeID
      t.integer :transmitterID

      t.timestamps
    end
  end
end
