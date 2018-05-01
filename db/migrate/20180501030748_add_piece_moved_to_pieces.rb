class AddPieceMovedToPieces < ActiveRecord::Migration[5.0]
  def change
    add_column :pieces, :moved, :boolean
  end
end
