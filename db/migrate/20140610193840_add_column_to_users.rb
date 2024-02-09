# frozen_string_literal: true

class AddColumnToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :fin, :boolean, default: false
  end
end
