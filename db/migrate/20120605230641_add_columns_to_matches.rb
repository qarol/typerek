# frozen_string_literal: true

class AddColumnsToMatches < ActiveRecord::Migration[4.2]
  def change
    add_column :matches, :result_a, :integer
    add_column :matches, :result_b, :integer
  end
end
