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
      unless real_move?(new_x, new_y)
        raise ArgumentError, "#{type} has not moved."
      end
      unless valid_move?(new_x, new_y)
        raise ArgumentError, "Invalid move for #{type}"
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

  # stubs to make Rspec work, this can possibly be updated if we refactor
  def valid_move?(_new_x, _new_y)
    true
  end



  # checks if piece can make the desired moved
  def valid_move?(new_x, new_y)
    if game.square_occupied?(new_x, new_y)
      white? != game.find_piece(new_x, new_y).white?
    elsif x < 0 || x > 7 || y < 0 || y > 7
      false
    else
      true
    end
  end

  #Checking all obstruction
  def is_obstructed?(new_x, new_y)
  return diagonal_obstruction?(new_x, new_y if is_diagonal?(new_x, new_y)
  return vertical_obstruction?(new_x, new_y) if is_vertical?(new_x, new_y)
  return horizontal_obstruction?(new_x, new_y) if is_horizontal?(new_x, new_y)
  raise 'Invalid input. Not diagonal, horizontal or vertical.'
  end

  # Checking vertical move and obstruction
  def horizontal_move?(new_x, new_y)
    y_position == new_y
  end

  def horizontal_obstruction?(new_x, new_y)
    is_obstructed = false
    ((x_position + 1)..new_x).each do |x|
      if game.piece_at(x, new_y)
        is_obstructed = true
        break
      end
    end
    is_obstructed
  end

  # Checking vertical move and obstruction
  def vertical_move?(new_x, _new_y)
    x_position == new_x
  end

  def vertical_obstruction?(new_x, new_y)
    is_obstructed = false
    ((y_position + 1)..new_y).each do |y|
      if game.piece_at(new_, y)
        is_obstructed = true
        break
      end
    end
    is_obstructed
  end

  # Checking diagonal move and obstruction

  def diagonal_move?(new_x, new_y)
    new_y - x_position == new_y - y_position
  end

  def diagonal_obstruction?(new_x, new_y)
    is_obstructed = false
    y_pos = (y_position + 1)
    ((x_position + 1)..new_).each do |x|
      if game.piece_at(x, y_pos)
        is_obstructed = true
        break
      end
      y_pos += 1
    end
<<<<<<< HEAD

                        return true
                      end
                    end
                  end
                end
              end
=end 
      


  

  


    is_obstructed
  end
end



    


    

    

  



#
#   def is_obstructed?(new_x, new_y)
#     vertical_move = x1 === x2
#     if vertical_move
#       if y1 < y2
#         small_y = y1
#         big_y = y2
#       else
#         small_y = y2
#         big_y = y1
#       end
#     end
#   end
#
#   **this can be checked for with is_white? logic in the move_to! method
#
#     def own_piece_at_destination?(new_x, new_y)
#       square_occupied?(new_x, new_y) && self.color === game.get_piece_at_coor(new_x, new_y).color
#     end
#
#       while i < big_y
#         if $board[x1][i].nil?
#           i += 1
#         else
#           return false
#         end
#       end
#       return true
#     end
#
#
#
#
#     def is_obstructed?(x1, y1, x2, y2)
#       vertical_move = x1 === x2
#       if vertical_move
#         if (y1 < y2)
#           small_y = y1
#           big_y = y2
#         else
#           small_y = y2
#           big_y = y1
#
#     diagonal_move = (x1 != x2) && (y1 != y2)
#     if diagonal_move
#       raise 'Invalid move' if (x1 - x2).abs != (y1 - y2).abs
#
#       if (x1 < x2) && (y1 < y2)
#         x = x1 + 1
#         y = y1 + 1
#         while x < x2
#           if $board[x][y].nil?
#             x += 1
#             y += 1
#           else
#             return false
#           end
#
#         end
#
#
#         i = small_y + 1
#
#         while i < big_y  do
#           if ($board[x1][i] === nil)
#             i +=1
#
#       if (x1 < x2) && (y1 > y2)
#         x = x1 + 1
#         y = y1 - 1
#         while x < x2
#           if $board[x][y].nil?
#             x += 1
#             y -= 1
#
#           else
#             return false
#           end
#         end
#         return true
#       end
#
#       horizontal_move = y1 === y2
#       if horizontal_move
#         if (x1 < x2)
#           small_x = x1
#           big_x = x2
#         else
#           small_x = x2
#           big_x = x1
#         end
#
#         i = small_x + 1
#
#
#         while i < big_x do
#           if ($board[i][y1] === nil)
#             i +=1
#
#       if (x1 > x2) && (y1 < y2)
#         x = x1 - 1
#         y = y1 + 1
#         while x > x2
#           if $board[x][y].nil?
#             x -= 1
#             y += 1
#
#           else
#             return false
#           end
#         end
#         return true
#       end
#
#
#
#
#       diagonal_move = (x1 != x2) && (y1 != y2)
#       if diagonal_move
#         if (x1 - x2).abs != (y1 - y2).abs
#           raise "Invalid move"
#         end
#
#         if ((x1 < x2) && (y1 < y2))
#           x = x1 + 1
#           y = y1 + 1
#           while x < x2 do
#             if ($board[x][y] === nil)
#               x += 1
#               y += 1
#             else
#               return false
#             end
#
#
#       if (x1 > x2) && (y1 > y2)
#         x = x1 - 1
#         y = y1 - 1
#         while x > x2
#           if $board[x][y].nil?
#             x -= 1
#             y -= 1
#           else
#             return false
#
#           end
#           return true
#         end
#
#
#         if ((x1 < x2) && (y1 > y2))
#           x = x1 + 1
#           y = y1 - 1
#           while x < x2 do
#             if ($board[x][y] === nil)
#               x += 1
#               y -= 1
#             else
#               return false
#             end
#           end
#           return true
#         end
#
#         if ((x1 > x2) && (y1 < y2))
#           x = x1 - 1
#           y = y1 + 1
#           while x > x2 do
#             if ($board[x][y] === nil)
#               x -= 1
#               y += 1
#             else
#               return false
#             end
#           end
#           return true
#         end
#
#         if ((x1 > x2) && (y1 > y2))
#           x = x1 - 1
#           y = y1 - 1
#           while x > x2 do
#             if ($board[x][y] === nil)
#               x -= 1
#               y -= 1
#             else
#               return false
#             end
#           end
#             return true
#           end
#         end
#       end
#     end
#
#                         return true
#                       end
#                     end
#                   end
#                 end
#               end

  
      

