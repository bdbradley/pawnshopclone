class King < Piece
	def valid_move?(new_x, new_y)
    return false if is_obstructed?(new_x.to_i, new_y.to_i)
    return true if
       x_difference == (new_x.to_i - x_position).abs
    y_difference = (new_y.to_i - y_position).abs
    return true if (x_difference <= 1) && (y_difference <= 1)
    false
  end
end

# Castling

	def can_castle?(new_x, new_y)
	  never_moved? && (castle_kingside?(new_x, new_y) || castle_queenside?(new_x, new_y))
	end

	# determines if king is attempting to castle on the kingside
	def castle_kingside?(new_x, new_y)
	  x == 6 && y == y_position && castle_rook_kingside && \
	    castle_rook_kingside.never_moved? && \
	    castle_rook_kingside.path_blocked?(4, y_position) == false
	end

	# determines if king is attempting to castle on the queenside
	def castle_queenside?(new_x, new_y)
	  x == 2 && y == y_position && castle_rook_queenside && \
	    castle_rook_queenside.never_moved? && \
	    castle_rook_queenside.path_blocked?(4, y_position) == false
	end

	# determines if there is a rook to castle with kingside
	def castle_rook_kingside
	  @castle_rook_kingside = game.pieces.where(x_position: 7, y_position: y_position, type: 'Rook').first
	end

	# determines if there is a rook to castle with queenside
	def castle_rook_queenside
	  @castle_rook_queenside = game.pieces.where(x_position: 0, y_position: y_position, type: 'Rook').first
	end

	# moves the rook when castling
	def castle!(new_x, new_y)
	  if castle_kingside?(new_x, new_y)
	    castle_rook_kingside.update_attributes(x_position: 5, y_position: y_position)
	  end
	  if castle_queenside?(new_x, new_y)
	    castle_rook_queenside.update_attributes(x_position: 3, y_position: y_position)
	  end
	  update_attributes(x_position: new_x, y_position: new_y)
	end

	def move_to!(new_x, new_y)
	  castle!(new_x, new_y) if can_castle?(new_x, new_y)
	  super(new_x, new_y)
	end

KING = 'King'.freeze
