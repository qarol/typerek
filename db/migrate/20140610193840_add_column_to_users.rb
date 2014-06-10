class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fin, :boolean, :default => false
  end
end
