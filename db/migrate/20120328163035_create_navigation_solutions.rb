class CreateNavigationSolutions < ActiveRecord::Migration
  def change
    create_table :navigation_solutions do |t|
      t.integer :receiverID
      t.integer :navigationSolverID
      t.integer :offsetTimeID
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
    add_index :navigation_solutions, [:receiverID, :offsetTimeID], :name => 'navigation_solution_unique_values', :unique => true
    
  end
end
