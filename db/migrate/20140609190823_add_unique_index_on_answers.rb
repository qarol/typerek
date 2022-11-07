class AddUniqueIndexOnAnswers < ActiveRecord::Migration[4.2]
  def change
    add_index :answers, [:match_id, :user_id], :unique => true
  end
end
