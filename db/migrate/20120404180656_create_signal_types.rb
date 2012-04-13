class CreateSignalTypes < ActiveRecord::Migration
  def change
    create_table :signal_types do |t|
      t.string :name

      t.timestamps
    end
    add_index :signal_types, [:name], :name => 'signal_type_unique_values', :unique => true
  end
end
