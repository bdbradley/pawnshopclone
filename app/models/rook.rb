class Rook < Piece

  def valid_move?(new_x, new_y)
    return false if is_obstructed?(new_x.to_i, new_y.to_i)
    return true if new_x.to_i == x_position || new_y.to_i == y_position
    false
  end

  def is_obstructed?(new_x, new_y)
    x1 = self.x_position
    y1 = self.y_position
    if x1 === new_x
      is_vertically_obstructed?(new_x, new_y)
    elsif y1 === new_y
      is_horizontally_obstructed?(new_x, new_y)
    end
  end
end
