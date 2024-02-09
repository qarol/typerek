# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[4.2]
  def change
    create_table :answers do |t|
      t.integer :match_id
      t.integer :user_id
      t.integer :result

      t.timestamps
    end
    add_index :answers, :match_id
    add_index :answers, :user_id
  end
end
