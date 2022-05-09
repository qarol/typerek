class AddMissedIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :comments, :user_id
    add_index :comments, :match_id
  end
end
