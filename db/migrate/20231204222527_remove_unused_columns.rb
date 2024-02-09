# frozen_string_literal: true

class RemoveUnusedColumns < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :email, :string, limit: 255
    remove_column :users, :encrypted_password, :string, limit: 255, default: ''
    remove_column :users, :reset_password_token, :string, limit: 255
    remove_column :users, :reset_password_sent_at, :datetime
    remove_column :users, :remember_created_at, :datetime
    remove_column :users, :sign_in_count, :integer, default: 0, null: false
    remove_column :users, :current_sign_in_at, :datetime
    remove_column :users, :last_sign_in_at, :datetime
    remove_column :users, :current_sign_in_ip, :datetime
    remove_column :users, :last_sign_in_ip, :datetime
    remove_column :users, :confirmation_token, :string, limit: 255
    remove_column :users, :confirmed_at, :datetime
    remove_column :users, :confirmation_sent_at, :datetime
    remove_column :users, :unconfirmed_email, :string, limit: 255
    remove_column :users, :invitation_token, :string, limit: 255
    remove_column :users, :invitation_created_at, :datetime
    remove_column :users, :invitation_sent_at, :datetime
    remove_column :users, :invitation_limit, :integer
  end
end
