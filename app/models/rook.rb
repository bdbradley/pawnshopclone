class Rook < Piece
  def valid_move?(new_x, new_y)
    square_occupied?(new_x, new_y) && self.color != game.get_piece_at_coor(new_x, new_y).color
    !is_obstructed?(new_x, new_y)
    (y_position == new_y) && (x_position != new_x) || (x_position == new_x) && (y_position !=new_y)
    !off_board?(new_x new_y)
  end
end
