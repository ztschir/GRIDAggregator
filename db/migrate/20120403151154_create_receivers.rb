class CreateReceivers < ActiveRecord::Migration
  def change
    create_table :receivers do |t|
      t.string :Name

      t.timestamps
    end
  end
end
