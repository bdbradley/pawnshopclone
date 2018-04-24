class Piece < ApplicationRecord
  
belongs_to :game

	def color
    return 'white' if is_white == true
    'black'
  end 

  def render
  	"#{color}-#{type.downcase}.png"
	end

  def get_piece_at_coor(x_pos, y_pos)
    pieces.find_by(x_position: x_pos, y_position: y_pos)
  end

  def move_piece(new_x, new_y)
    piece_to_move = game.get_piece_at_coor
    update(x_position: new_x, y_position: new_y)
  end

	def square_occupied?(new_x, new_y)
    piece = game.pieces.find_by(x_position: new_x, y_position: new_y)
    return false if piece.nil?
    true
  end

	def off_board?(new_x, new_y)
    new_x < 1 || new_x > 8 || new_y < 1 || new_y > 8
  end

end


 
  






PAWN = "Pawn".freeze 
ROOK = "Rook".freeze
KNIGHT = "Knight".freeze
BISHOP = "Bishop".freeze
QUEEN = "Queen".freeze
KING = "King".freeze




  


 

