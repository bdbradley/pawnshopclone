require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:white_player) do
    User.create!(name: "White Player", password: "password", email: "dummy@gmail.com")
  end
  let(:black_player) do
    User.create!(name: "Black Player", password: "password1", email: "dummy1@gmail.com")
  end
  let(:game) do
    Game.create!(white_player: white_player, black_player: black_player, name: "Test Chess Name")
  end

  describe 'populate_board!' do
    it 'should have correct number of pieces' do
      game.populate_board!
      expect(game.pieces.count).to eq 32
    end
  end

  describe 'in_check method' do

    context 'Rook pieces' do
      it 'True when opposing piece can capture king' do
        black_rook = Rook.create!(x_position: 0, y_position: 7, game: game, is_white: true)
        white_king = King.create!(x_position: 0, y_position: 0, game: game, is_white: true)

        expect(game.in_check?('WHITE')).to eq(true)
      end
    end
  end

  describe 'capture_opponent_causing_check?' do
    it 'True if white king enemies causing check are capturable' do
      king = King.new(x_position: 4, y_position: 4, game: game, is_white: true)
      queen = Queen.new(x_position: 3, y_position: 4, game: game, is_white: true)

      expect(game.capture_opponent_causing_check?('WHITE')).to eq true
    end
  end


  describe 'can_move_out_of_check?' do
    it 'True if white king can move out of check' do
      king = King.new(x_position: 4, y_position: 4, game: game, is_white: true)
      queen = Queen.new(x_position: 5, y_position: 4, game: game, is_white: true)
      expect(game.i_can_move_out_of_check?('WHITE')).to eq true
    end
  end


  describe 'can_avoid_check?' do
    it 'True if white king can avoid check' do
        king = King.new(x_position: 4, y_position: 4, game: game, is_white: true)
        rook = Rook.new(x_position: 3, y_position: 1, game: game, is_white: true)
        rook1 = Rook.new(x_position: 5, y_position: 1, game: game, is_white: true)
        rook2 = Rook.new(x_position: 1, y_position: 3, game: game, is_white: true)
        rook3 = Rook.new(x_position: 1, y_position: 5, game: game, is_white: true)
      expect(game.i_can_avoid_check?('WHITE')).to eq false
    end
  end
end
