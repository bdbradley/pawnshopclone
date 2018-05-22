require 'rails_helper'

RSpec.describe King, type: :model do
  describe '#valid_move?' do
    let(:king) { FactoryBot.create :king, x_position: 2, y_position: 2, is_white: true }

    it 'is successful to up/right' do
      expect(king.valid_move?(2, 3)).to eq true
    end

    it 'is successful to down/left' do
      expect(king.valid_move?(4, 4)).to eq true
    end
  end
end

  describe 'castle!' do
    it 'should move the rook to correct position when castling kingside' do
      game = Game.create(white_player_id: 0, black_player_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id, user_id: 1 )
      rook = Rook.create(x_position: 0, y_position: 0, game_id: game.id, user_id: 1 )
      rook = Rook.create(x_position: 7, y_position: 0, game_id: game.id, user_id: 1)
      king.can_castle?(6,0)
      king.castle!(6,0)
      expect(game.pieces.where(x_position: 5, y_position: 0).first).to have_attributes(:type => "Rook")
    end

    it 'should move the rook to correct position when castling queenside' do
      game = Game.create(white_player_id: 0, black_player_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: id)
      rook = Rook.create(x_position: 0, y_position: 0, game_id: id)
      rook = Rook.create(x_position: 7, y_position: 0, game_id: id)
      king.can_castle?(2,0)
      king.castle!(2,0)
      expect(game.pieces.where(x_position: 3, y_position: 0).first).to have_attributes(:type => "Rook")
    end
  end
