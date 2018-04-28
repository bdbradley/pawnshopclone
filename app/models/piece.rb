class Piece < ApplicationRecord


belongs_to :game

	def color
    return 'white' if is_white == true
    'black'
  end 

  def render
  	"#{color}-#{type.downcase}.png"
	end

  def move_piece!(new_x, new_y)
    transaction do
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

  def capture_piece!(captured_piece)
    captured_piece.update(x_position: nil, y_position: nil)
  end

  def move_to!(new_x, new_y)
    if square_occupied?(new_x, new_y)
      piece_in_square = game.get_piece_at_coor(new_x, new_y)
      if piece_in_square.color === self.color
        raise ArgumentError, 'Invalid move. Cannot capture your own piece.'
      else
        capture_piece(piece_in_square)
        self.update(x_position: new_x, y_position: new_y)
      end
    else
      self.update(x_position: new_x, y_position: new_y)
    end
  end

  def is_obstructed?(x1, y1, x2, y2)
    vertical_move = x1 === x2
    if vertical_move
      if (y1 < y2)
        small_y = y1
        big_y = y2
      else
        small_y = y2
        big_y = y1
      end

      i = small_y + 1

      while i < big_y  do
        if ($board[x1][i] === nil)
          i +=1
        else
          return false
        end
      end
      return true
    end
    
    horizontal_move = y1 === y2
    if horizontal_move
      if (x1 < x2)
        small_x = x1
        big_x = x2
      else
        small_x = x2
        big_x = x1
      end

      i = small_x + 1

      while i < big_x do
        if ($board[i][y1] === nil)
          i +=1
        else
          return false
        end
      end
      return true
    end
    
    
    diagonal_move = (x1 != x2) && (y1 != y2)
    if diagonal_move
      if (x1 - x2).abs != (y1 - y2).abs
        raise "Invalid move"
      end
      
      if ((x1 < x2) && (y1 < y2)) 
        x = x1 + 1
        y = y1 + 1
        while x < x2 do
          if ($board[x][y] === nil)
            x += 1
            y += 1
          else
            return false
          end
        end
        return true
      end

      if ((x1 < x2) && (y1 > y2)) 
        x = x1 + 1
        y = y1 - 1
        while x < x2 do
          if ($board[x][y] === nil)
            x += 1
            y -= 1
          else
            return false
          end
        end
        return true
      end

      if ((x1 > x2) && (y1 < y2)) 
        x = x1 - 1
        y = y1 + 1
        while x > x2 do
          if ($board[x][y] === nil)
            x -= 1
            y += 1
          else
            return false
          end
        end
        return true
      end

      if ((x1 > x2) && (y1 > y2)) 
        x = x1 - 1
        y = y1 - 1
        while x > x2 do
          if ($board[x][y] === nil)
            x -= 1
            y -= 1
          else
            return false
          end
        end
        return true
      end
    end
  end 
end



PAWN = "Pawn".freeze 
ROOK = "Rook".freeze
KNIGHT = "Knight".freeze
BISHOP = "Bishop".freeze
QUEEN = "Queen".freeze
KING = "King".freeze
