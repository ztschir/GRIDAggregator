class CreateNavigationSolvers < ActiveRecord::Migration
  def change
    create_table :navigation_solvers do |t|
      t.string :name

      t.timestamps
    end
    add_index :navigation_solvers, [:name], :name => 'navigation_solvers_unique_values', :unique => true
  end
end
