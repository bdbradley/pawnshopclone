class AddFieldsToPieces < ActiveRecord::Migration[5.0]
  
  def change
  	add_column :pieces, :game_id, :integer, index: true
  	add_column :pieces, :is_white, :boolean  
    add_index :pieces, :game_id

  end

end

