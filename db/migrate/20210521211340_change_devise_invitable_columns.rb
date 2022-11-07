class ChangeDeviseInvitableColumns < ActiveRecord::Migration[4.2]
  def up
    change_column :users, :invitation_token, :string, limit: nil
    remove_index :users, :invitation_token
    add_index :users, :invitation_token, unique: true
  end

  def down
    change_column :users, :invitation_token, :string, limit: 60
    remove_index :users, :invitation_token
    add_index :users, :invitation_token
  end
end
