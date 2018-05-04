class AddColumnToGames < ActiveRecord::Migration[5.0]
  def change
  	add_column :games, :white_player_turn, :boolean, :default => true
  end
end
