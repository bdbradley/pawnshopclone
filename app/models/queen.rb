class Queen < Piece

	  def valid_move?(new_x, new_y)
	    return false if !super(new_x, new_y)
	    horizontal_move?(new_x, new_y) ||  vertical_move?(new_x, new_y) ||  diagonal_move?(new_x, new_y)
	  end

end
