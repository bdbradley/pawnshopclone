class Knight < Piece

	def valid_move?(new_x, new_y)
		#needs refactoring, but normal is_obstructed method doesn't apply since knight "jumps" over pieces
	  return false if squared_occupied?(new_y, new_y)
	  return false if off_board?(new_x, new_y)
	  return true if 
	  	(x_position - new_x.to_i).abs == 1 && (y_position - new_y.to_i).abs == 2 ||
	  	(x_position - new_x.to_i).abs == 2 && (y_position - new_y.to_i).abs == 1  
	end 
	  false 
end
  


 
