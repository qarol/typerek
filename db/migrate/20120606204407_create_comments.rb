# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[4.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :match_id
      t.text :content

      t.timestamps
    end
  end
end
