class CreateNavigationSolutions < ActiveRecord::Migration
  def change
    create_table :navigation_solutions do |t|
      t.integer :receiverID
      t.integer :navigationSolverID
      t.float :xPosition
      t.float :yPosition
      t.float :zPosition
      t.float :deltaReceiverClockError
      t.float :xVelocity
      t.float :yVelocity
      t.float :zVelocity
      t.float :deltaReceiverClockErrorDot

      t.timestamps
    end
  end
end
