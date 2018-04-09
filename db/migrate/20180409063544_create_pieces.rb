class CreatePieces < ActiveRecord::Migration[5.0]
  def change
    create_table :pieces do |t|
      t.integer :id_for_piece
      t.string :type
      t.integer :x_position
      t.integer :y_position
      t.string :color
      t.string :image
      t.timestamps
    end
  end
end
