class AddUniqueIndexOnAnswers < ActiveRecord::Migration
  def change
    add_index :answers, [:match_id, :user_id], :unique => true
  end
end
