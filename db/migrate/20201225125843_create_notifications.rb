class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :status, default: 0
      t.string :data

      t.timestamps
    end
  end
end
