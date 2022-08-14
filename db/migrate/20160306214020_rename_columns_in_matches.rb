class RenameColumnsInMatches < ActiveRecord::Migration[5.0]
  def change
    rename_column :matches, :teamA, :team_a
    rename_column :matches, :teamB, :team_b
    rename_column :matches, :winA, :win_a
    rename_column :matches, :winB, :win_b
    rename_column :matches, :winTieA, :win_tie_a
    rename_column :matches, :winTieB, :win_tie_b
    rename_column :matches, :NotTie, :not_tie
    rename_column :matches, :resultA, :result_a
    rename_column :matches, :resultB, :result_b
  end
end
