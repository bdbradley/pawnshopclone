class Pawn < Piece

  def valid_move?(new_x, new_y)
    x_dif = (new_x.to_i - x_position).abs
    y_dif = (new_y.to_i - y_position).abs
    (x_dif == 0) && (y_dif == 1)
  end
end
