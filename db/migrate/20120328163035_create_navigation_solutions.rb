class CreateNavigationSolutions < ActiveRecord::Migration
  def change
    create_table :navigation_solutions do |t|
      t.integer :receiver_id
      t.integer :navigation_solver_id
      t.integer :offset_time_id
      t.float :x_position
      t.float :y_position
      t.float :z_position
      t.float :delta_receiver_clock_error
      t.float :x_velocity
      t.float :y_velocity
      t.float :z_velocity
      t.float :delta_receiver_clock_error_dot

      t.timestamps
    end
    add_index :navigation_solutions, [:receiver_id, :offset_time_id], :name => 'navigation_solution_unique_values', :unique => true
    
  end
end
