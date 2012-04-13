class CreateChannelStatuses < ActiveRecord::Migration
  def change
    create_table :channel_statuses do |t|
      t.string :name

      t.timestamps
    end
    add_index :channel_statuses, [:name], :name => 'channel_status_unique_values', :unique => true
  end
end
