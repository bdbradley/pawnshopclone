class Game < ApplicationRecord
  belongs_to :white_player, class_name: 'User'
  belongs_to :black_player, class_name: 'User', optional: true

  has_many :pieces

  scope :available, -> { where('white_player_id IS NULL OR black_player_id IS NULL') }
  scope :ongoing, -> { where.not('white_player_id IS NULL OR black_player_id IS NULL') }

  validates :name, :presence => true
  
  

  def populate_board!
    
    (1..8).each do |i|
      Piece.create(game_id: id, is_white: true, type: PAWN, x_position: i, y_position: 2)
    end

    Piece.create(game_id: id, is_white: true, type: ROOK, x_position: 1, y_position: 1)
    Piece.create(game_id: id, is_white: true, type: ROOK, x_position: 8, y_position: 1)

    Piece.create(game_id: id, is_white: true, type: KNIGHT, x_position: 2, y_position: 1)
    Piece.create(game_id: id, is_white: true, type: KNIGHT, x_position: 7, y_position: 1)

    Piece.create(game_id: id, is_white: true, type: BISHOP, x_position: 3, y_position: 1)
    Piece.create(game_id: id, is_white: true, type: BISHOP, x_position: 6, y_position: 1)

    Piece.create(game_id: id, is_white: true, type: KING, x_position: 4, y_position: 1)
    Piece.create(game_id: id, is_white: true, type: QUEEN, x_position: 5, y_position: 1)

    #Black Player#
    (1..8).each do |i|
      Piece.create(game_id: id, is_white: false, type: PAWN, x_position: i, y_position: 7)
    end

    Piece.create(game_id: id, is_white: false, type: ROOK, x_position: 1, y_position: 8)
    Piece.create(game_id: id, is_white: false, type: ROOK, x_position: 8, y_position: 8)

    Piece.create(game_id: id, is_white: false, type: KNIGHT, x_position: 2, y_position: 8)
    Piece.create(game_id: id, is_white: false, type: KNIGHT, x_position: 7, y_position: 8)

    Piece.create(game_id: id, is_white: false, type: BISHOP, x_position: 3, y_position: 8)
    Piece.create(game_id: id, is_white: false, type: BISHOP, x_position: 6, y_position: 8)

    Piece.create(game_id: id, is_white: false, type: KING, x_position: 5, y_position: 8)
    Piece.create(game_id: id, is_white: false, type: QUEEN, x_position: 4, y_position: 8)
  end

  def render_piece(x_pos, y_pos)
    piece = get_piece_at_coor(x_pos, y_pos)
    piece.render if piece.present?
  end

  def get_piece_at_coor(x_pos, y_pos)
    pieces.find_by(x_position: x_pos, y_position: y_pos)
  end

end
