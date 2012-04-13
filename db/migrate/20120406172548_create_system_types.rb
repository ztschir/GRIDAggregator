class CreateSystemTypes < ActiveRecord::Migration
  def change
    create_table :system_types do |t|
      t.string :name

      t.timestamps
    end
    add_index :system_types, [:name], :name => 'system_type_unique_values', :unique => true
  end
end
