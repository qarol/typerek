class AddMissedIndexes < ActiveRecord::Migration
  def change
    add_index :comments, :user_id
    add_index :comments, :match_id
  end
end
