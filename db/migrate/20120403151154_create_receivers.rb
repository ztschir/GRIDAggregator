class CreateReceivers < ActiveRecord::Migration
  def change
    create_table :receivers do |t|
      t.string :name

      t.timestamps
    end
    
    add_index :receivers, [:name], :name => 'receivers_unique_values', :unique => true
  end
end
