class Knight < Piece

    def valid_move?(new_x, new_y)
      x_dif = (new_x.to_i - x_position).abs
      y_dif = (new_y.to_i - y_position).abs
      #knight moves one up and two over or two up and one over
      (x_dif == 1 && y_dif == 2) || (x_dif == 2 && y_dif == 1)
    end
  
end

 
