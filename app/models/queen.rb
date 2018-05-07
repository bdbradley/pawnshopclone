class Queen < Piece

		#Nikko version of valid_move?
	  def valid_queen_move(new_x, new_y)
	    vertical_move = self.x_position === new_x && self.y_position != new_y
	    horizontal_move = self.y_position === new_y && self.x_position != new_x
	  end

		#Linh version of valid_move?
	  def valid_move?(new_x, new_y)
	    return false if !super(new_x, new_y)
	    horizontal_move?(new_x, new_y) ||  vertical_move?(new_x, new_y) ||  diagonal_move?(new_x, new_y)
	  end 

	  #Ryan version to add to mix 

	  def valid_move?(new_x, new_y)
    	unless is_obstructed?(new_x.to_i, new_y.to_i)
      	return true if (new_x.to_i - x_position).abs == (new_y.to_i - y_position).abs || new_x.to_i == x_position || new_y.to_i == y_position
    	end
    	false
  	end

end
#Not sure which valid_move? to use?
