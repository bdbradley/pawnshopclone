class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :id_for_game
      t.integer :name
      t.string :black_player_id
      t.string :white_player_id
      t.timestamps
    end
  end
end
