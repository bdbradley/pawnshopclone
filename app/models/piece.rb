class Piece < ApplicationRecord
  belongs_to :user
	belongs_to :game


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
      if (y1 < y2) && (x1 < x2)
        small_y = y1
        big_y = y2
        small_x = x1
      elsif (y1 < y2) && (x2 < x1)
        small_y = y1
        big_y = y2
        small_x = x2
      elsif (y1 > y2) && (x1 < x2)
        small_y = y2
        big_y = y1
        small_x = x1
      else (y1 > y2) && (x2 < x1)
        small_y = y2
        big_y = y1
        small_x = x2
      end

      i = small_y + 1
      x = small_x + 1
      
      while i < big_y do
        if ($board[i][x] === nil)
          i +=1
          x +=1
        else
          return false
        end
      end
      return true
    end
  end
end



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

# # These should return false because of the 1 in the way
# puts is_obstructed? 3, 2, 3, 6
# puts is_obstructed? 0, 4, 6, 4
# puts is_obstructed? 1, 2, 5, 6


