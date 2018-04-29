class Rook < Piece
  def move_rook(new_x, new_y)
    if valid_move?(new_x, new_y) 
      self.move_to!(new_x, new_y)
  end
end
