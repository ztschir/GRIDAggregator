class CreateNavigationImports < ActiveRecord::Migration
  def change
    create_table :navigation_imports do |t|
      t.integer :receiver_id
      t.integer :offset_week_number
      t.integer :offset_whole_seconds_of_week
      t.float :offset_fractional_second
      t.float :x_position
      t.float :y_position
      t.float :z_position
      t.float :delta_receiver_clock_error
      t.float :x_velocity
      t.float :y_velocity
      t.float :z_velocity
      t.float :delta_receiver_clock_error_dot
      t.integer :navigation_solver_id

      t.timestamps
    end
  end
end
