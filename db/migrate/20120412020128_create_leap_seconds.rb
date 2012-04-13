class CreateLeapSeconds < ActiveRecord::Migration
  def change
    create_table :leap_seconds do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
