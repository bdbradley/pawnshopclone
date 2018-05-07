class Rook < Piece
  def valid_move?(new_x, new_y)
    return false if is_obstructed?(new_x.to_i, new_y.to_i)
    return true if 
    	(x_position == new_x) && (y_position != new_y) ||
    	(y_position == new_y) && (x_position != new_x)
    end 
    false 
  end 
end 
