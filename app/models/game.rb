class Game < ApplicationRecord
  belongs_to :white_player, class_name: 'User'
  belongs_to :black_player, class_name: 'User', optional: true

  has_many :pieces

  scope :available, -> { where('white_player_id IS NULL OR black_player_id IS NULL') }
  scope :ongoing, -> { where.not('white_player_id IS NULL OR black_player_id IS NULL') }

  validates :name, :presence => true

  
  
  
  

  def populate_board!
    
    (1..8).each do |i|
      Pawn.create(game_id: id, is_white: true, x_position: i, y_position: 2)
    end

    Rook.create(game_id: id, is_white: true, x_position: 1, y_position: 1)
    Rook.create(game_id: id, is_white: true,  x_position: 8, y_position: 1)

    Knight.create(game_id: id, is_white: true,  x_position: 2, y_position: 1)
    Knight.create(game_id: id, is_white: true,  x_position: 7, y_position: 1)

    Bishop.create(game_id: id, is_white: true, x_position: 3, y_position: 1)
    Bishop.create(game_id: id, is_white: true, x_position: 6, y_position: 1)

    King.create(game_id: id, is_white: true, x_position: 4, y_position: 1)
    Queen.create(game_id: id, is_white: true, x_position: 5, y_position: 1)

    #Black Player#
    (1..8).each do |i|
      Pawn.create(game_id: id, is_white: false, x_position: i, y_position: 7)
    end

    Rook.create(game_id: id, is_white: false, x_position: 1, y_position: 8)
    Rook.create(game_id: id, is_white: false, x_position: 8, y_position: 8)

    Knight.create(game_id: id, is_white: false, x_position: 2, y_position: 8)
    Knight.create(game_id: id, is_white: false, x_position: 7, y_position: 8)

    Bishop.create(game_id: id, is_white: false, x_position: 3, y_position: 8)
    Bishop.create(game_id: id, is_white: false, x_position: 6, y_position: 8)

    King.create(game_id: id, is_white: false, x_position: 5, y_position: 8)
    Queen.create(game_id: id, is_white: false, x_position: 4, y_position: 8)
  end

  def render_piece(x_pos, y_pos)
    piece = get_piece_at_coor(x_pos, y_pos)
    piece.render if piece.present?
  end

  def get_piece_at_coor(x_pos, y_pos)
    pieces.find_by(x_position: x_pos, y_position: y_pos)
  end

end
