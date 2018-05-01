class Bishop < Piece
  def valid_move?(new_x, new_y)
    x1 = self.x_position
    y1 = self.y_position
    square_occupied?(new_x, new_y) && self.color != game.get_piece_at_coor(new_x, new_y).color
    !is_obstructed?(new_x, new_y)
    x_position != new_x && y_position != new_y
    (x1 + new_x).abs === (y1 + new_y).abs
    !off_board?(new_x new_y)
  end
end
