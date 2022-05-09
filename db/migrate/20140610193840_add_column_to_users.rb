class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :fin, :boolean, :default => false
  end
end
