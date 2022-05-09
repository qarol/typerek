class AddColumnsToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :result_a, :integer
    add_column :matches, :result_b, :integer
  end
end
