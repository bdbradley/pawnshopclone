class Piece < ApplicationRecord
  belongs_to :game

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
  end

  def square_occupied?(new_x, new_y)
    piece = game.pieces.find_by(x_position: new_x, y_position: new_y)
    return false if piece.nil?
    true
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

  def off_board?(new_x, new_y)
    new_x < 1 || new_x > 8 || new_y < 1 || new_y > 8
   end

  def is_obstructed?(x1, y1, x2, y2)
    vertical_move = x1 === x2
    if vertical_move
      if y1 < y2
        small_y = y1
        big_y = y2
      else
        small_y = y2
        big_y = y1
      end

    def own_piece_at_destination?(new_x, new_y)
      square_occupied?(new_x, new_y) && self.color === game.get_piece_at_coor(new_x, new_y).color
    end

      while i < big_y
        if $board[x1][i].nil?
          i += 1
        else
          return false
        end
      end
      return true
    end

    horizontal_move = y1 === y2
    if horizontal_move
      if x1 < x2
        small_x = x1
        big_x = x2
      else
        small_x = x2
        big_x = x1
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

      while i < big_x
        if $board[i][y1].nil?
          i += 1

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

    diagonal_move = (x1 != x2) && (y1 != y2)
    if diagonal_move
      raise 'Invalid move' if (x1 - x2).abs != (y1 - y2).abs

      if (x1 < x2) && (y1 < y2)
        x = x1 + 1
        y = y1 + 1
        while x < x2
          if $board[x][y].nil?
            x += 1
            y += 1
          else
            return false
          end

        end


        i = small_y + 1

        while i < big_y  do
          if ($board[x1][i] === nil)
            i +=1

      if (x1 < x2) && (y1 > y2)
        x = x1 + 1
        y = y1 - 1
        while x < x2
          if $board[x][y].nil?
            x += 1
            y -= 1

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

      if (x1 > x2) && (y1 < y2)
        x = x1 - 1
        y = y1 + 1
        while x > x2
          if $board[x][y].nil?
            x -= 1
            y += 1

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


      if (x1 > x2) && (y1 > y2)
        x = x1 - 1
        y = y1 - 1
        while x > x2
          if $board[x][y].nil?
            x -= 1
            y -= 1
          else
            return false

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

        return true
      end
    end
  end
end

PAWN = 'Pawn'.freeze
ROOK = 'Rook'.freeze
KNIGHT = 'Knight'.freeze
BISHOP = 'Bishop'.freeze
QUEEN = 'Queen'.freeze
KING = 'King'.freeze

# $board = [
#   [nil, nil, nil, nil, nil, nil, nil, nil],
#   [nil, nil, nil, nil, nil, nil, nil, nil],
#   [nil, nil, nil, nil, nil, nil, nil, nil],
#   [nil, nil, nil, nil, 1,   nil, nil, nil],
#   [nil, nil, nil, nil, nil, nil, nil, nil],
#   [nil, nil, nil, nil, nil, nil, nil, nil],
#   [nil, nil, nil, nil, nil, nil, nil, nil],
#   [nil, nil, nil, nil, nil, nil, nil, nil]
# ]

# # These should be fine
# puts is_obstructed? 2, 2, 2, 5
# puts is_obstructed? 2, 2, 5, 2
# puts is_obstructed? 2, 2, 5, 5
# puts is_obstructed? 5, 5, 2, 2
# puts is_obstructed? 2, 5, 2, 2

# # These should return false because of the 1 in the way
# puts is_obstructed? 3, 2, 3, 6
# puts is_obstructed? 0, 4, 6, 4
# puts is_obstructed? 1, 2, 5, 6
# puts is_obstructed? 3, 6, 3, 2
# puts is_obstructed? 6, 4, 0, 4
# puts is_obstructed? 4, 5, 2, 3
# puts is_obstructed? 4, 3, 1, 6
>>>>>>> ls_rspec_wk4
