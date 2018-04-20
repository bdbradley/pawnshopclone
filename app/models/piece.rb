class Piece < ApplicationRecord
  
belongs_to :game

def color
    return 'white' if is_white == true
    'black'
  end

  def render
    "#{color}-#{type.downcase}.png"
  end
end 

PAWN = "Pawn".freeze
ROOK = "Rook".freeze
KNIGHT = "Knight".freeze
BISHOP = "Bishop".freeze
QUEEN = "Queen".freeze
KING = "King".freeze
