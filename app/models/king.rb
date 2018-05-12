class King < Piece
  def valid_move?(new_x, new_y)
    x_difference = (new_x - x_position)
    return true if x_difference == (new_x.to_i - x_position).abs

    y_difference = (new_y.to_i - y_position).abs
    return true if (x_difference <= 1) && (y_difference <= 1)
    false
  end


  def obstructed_squares(new_x, new_y)
    x_diff = (new_x - x_position)

    case x_diff
    when 2
      # move is kingside castle
      rectilinear_obstruction_array(7, new_y)
    when -2
      # move is queenside castle
      rectilinear_obstruction_array?(0, new_y)
    else
      # otherwise king moves one space - can't be obstructed - return empty
      return []
    end
  end

  # determine if king can move himself out of check
  def can_move_out_of_check?
    start_x = x_position
    start_y = y_position
    success = false
    ((x_position - 1)..(x_position + 1)).each do |x|
      ((y_position - 1)..(y_position + 1)).each do |y|
        #update_attributes(x_position: x, y_position: y)
        success = true if valid_move?(x, y)
        # if game.check?(color) comes up false,
        # even once, assign  true
        success = true unless game.check?(color)
        # reset any attempted moves
        #update_attributes(x_position: start_x, y_position: start_y)
      end
    end
    success
   end
end

KING = 'King'.freeze
