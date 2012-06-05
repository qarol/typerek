class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :teamA
      t.string :teamB
      t.datetime :start
      t.float :winA
      t.float :winB
      t.float :tie
      t.float :winTieA
      t.float :winTieB
      t.float :NotTie

      t.timestamps
    end
  end
end
