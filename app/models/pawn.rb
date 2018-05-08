class Pawn < Piece


  	def valid_move?(new_x, new_y)
      #return false if is_obstructed?(new_x.to_i, new_y.to_i)
      return true if pawn_capture?(new_x, new_y)
      return true if move_two_squares_ok?(new_x, new_y) && !square_occupied?(new_x, new_y)
    end
      
  
    def pawn_capture?(new_x, new_y)
      x_difference = (new_x.to_i - x_position.to_i).abs
      y_difference = (new_y.to_i - y_position.to_i).abs
      piece_to_capture   = Piece.exists?(x_position: new_x, y_position: new_y, is_white: !is_white, game: game)
      return true if piece_to_capture && x_difference == 1 && y_difference == 1
      false
    end

    def move_two_squares_ok?(new_x, new_y)
      x_difference = (new_x - x_position).abs
      y_difference = (new_y - y_position).abs
      if piece_moved?  
        x_difference.zero? && y_difference == 1
        #only allowed to move one space if pawn has already moved
      else
        x_difference.zero? && y_difference == 1 || x_difference.zero? && y_difference == 2
        #allowed to move 1 or 2 spaces if pawn has not moved yet
      end
    end
    
end