class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :content
      t.boolean :display, default: false

      t.timestamps null: false
    end
  end
end
