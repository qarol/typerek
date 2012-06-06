class AddColumnsToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :resultA, :integer
    add_column :matches, :resultB, :integer
  end
end
