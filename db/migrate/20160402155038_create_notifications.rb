# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[4.2]
  def change
    create_table :notifications do |t|
      t.text :content
      t.boolean :display, default: false

      t.timestamps null: false
    end
  end
end
