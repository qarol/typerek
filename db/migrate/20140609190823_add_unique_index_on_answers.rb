class AddUniqueIndexOnAnswers < ActiveRecord::Migration[5.0]
  def change
    add_index :answers, [:match_id, :user_id], :unique => true
  end
end
