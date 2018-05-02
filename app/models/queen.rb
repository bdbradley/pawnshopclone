class Queen < Piece

  def valid_queen_move(new_x, new_y)
    vertical_move = self.x_position === new_x && self.y_position != new_y
    horizontal_move = self.y_position === new_y && self.x_position != new_x
    diagonal_move = 
  end

end
