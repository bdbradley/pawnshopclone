class AddFieldsToGames < ActiveRecord::Migration[5.0]
  def change
  	add_index :games, :black_player_id
  	add_index :games, :white_player_id
  	add_column :games, :player_win, :integer 
  	add_column :games, :player_lose, :integer 
  end
end
