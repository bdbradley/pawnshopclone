class Queen < Piece

    def valid_move?(new_x, new_y)
        return false if square_occupied?(x_position, y_position)
        return false if self.is_obstructed?(x_position, y_position)
        horizontal_move?(x_position, y_position) ||  vertical_move?(x_position, y_position) ||  diagonal_move?(x_position, y_position)
    end
end
