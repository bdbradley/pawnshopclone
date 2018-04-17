class AddOwnerAndOpponentToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :owner_id, :integer
    add_column :games, :opponent_id, :integer
  end
end
