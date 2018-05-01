class AddPieceMovedToPieces < ActiveRecord::Migration[5.0]
  def change
    add_column :pieces, :piece_moved, :boolean, :default => false
  end
end
