class AddColumnsToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :result_a, :integer
    add_column :matches, :result_b, :integer
  end
end
