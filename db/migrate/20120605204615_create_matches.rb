# frozen_string_literal: true

class CreateMatches < ActiveRecord::Migration[4.2]
  def change
    create_table :matches do |t|
      t.string :team_a
      t.string :team_b
      t.datetime :start
      t.float :win_a
      t.float :win_b
      t.float :tie
      t.float :win_tie_a
      t.float :win_tie_b
      t.float :not_tie

      t.timestamps
    end
  end
end
