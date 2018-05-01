class Rook < Piece
  def valid_move?(new_x, new_y)
    unless is_obstructed?(new_x, new_y)
      return true if (new_x.to_i - x_position).abs == (new_y.to_i - y_position).abs || 
      new_x.to_i == x_position || 
      new_y.to_i == y_position
    end
    false
  end
end
