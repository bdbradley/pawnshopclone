class Rook < Piece
  def valid_move?(new_x, new_y)
    unless is_obstructed?(new_x, new_y)
      return true if (y_position == new_y) && (x_position != new_x) ||
        (x_position == new_x) && (y_position !=new_y)
    end 
  end
end
    

  
