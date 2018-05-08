class Piece < ApplicationRecord

  belongs_to :game

	def color
    return 'white' if is_white == true
    'black'
  end

  def render
  	"#{color}-#{type.downcase}.png"
	end

  def move_to!(new_x, new_y)
    transaction do 
      unless valid_move?(new_x, new_y)
        raise ArgumentError, "That is an invalid move for #{type}"
      end
      if square_occupied?(new_x, new_y)
        occupying_piece = game.get_piece_at_coor(new_x, new_y)
        raise ArgumentError, 'That is an invalid move. Cannot capture your own piece.' if (occupying_piece.is_white && is_white?) || (!occupying_piece.is_white && !is_white?)
        capture_piece(occupying_piece)
      end
      update(x_position: new_x, y_position: new_y)
    end 
  end 
      
        
  def square_occupied?(new_x, new_y)
    piece = game.pieces.find_by(x_position: new_x, y_position: new_y)
    return false if piece.nil?
    true
  end

  def off_board?(new_x, new_y)
      new_x < 1 || new_x > 8 || new_y < 1 || new_y > 8
  end

  def capture_piece!(captured_piece)
    captured_piece.update(x_position: nil, y_position: nil)
  end


  def real_move?(new_x, new_y)
    piece_found = game.get_piece_at_coor(new_x, new_y)
    return true if piece_found.nil?
    return false if piece_found.id == id
    true
  end

  def count_moves
    game.update(move_number: game.move_number + 1)
    update(game_move_number: game.move_number, piece_move_number: piece_move_number + 1)
    update(has_moved: true)

  end

  def is_obstructed?(new_x, new_y) 
    return false if type == KNIGHT 
    return true if off_board?(new_x, new_y)
    return true if square_occupied?(new_x, new_y)
  end 


	# stubs to make Rspec work, this can possibly be updated if we refactor
  def valid_move?(_new_x, _new_y)
    true
  end

  def horizontal_move?(_new_x, _new_y)
    true
  end

  def vertical_move?(_new_x, _new_y)
    true
  end

  def diagonal_move?(_new_x, _new_y)
    true
  end

  # end stubs

  
end 
      
  

