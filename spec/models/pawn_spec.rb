require 'rails_helper'

RSpec.describe Pawn, type: :model do

  let(:game) do
  Game.create(
    white_user: FactoryBot.create(:user),
    black_user: FactoryBot.create(:user))
  end

  describe '#valid_move?' do
    let(:pawn) { FactoryBot.create :pawn, x_position: 2, y_position: 2, is_white: true }

    it 'is successful to up/right' do
      expect(pawn.valid_move?(2, 3)).to eq true
    end
  end
  it 'is successful to down/left' do
    expect(pawn.valid_move?(4, 4)).to eq true
  end
end

describe 'Pawn Promotion' do
  context 'promotable method' do
    it 'Should show that a pawn is promotable' do
      board = create(:game)


      pawn = Pawn.create(color: 'WHITE', x_position: 0, y_position: 7, game_id: board.id)
      board.pieces << pawn

      expect(pawn.promotable?(0, 7)).to eq(true)
    end

    it 'Should show that a pawn is not promotable' do
      board = create(:game)

      pawn = Pawn.create(color: 'WHITE', x_position: 0, y_position: 6, game_id: board.id)
      board.pieces << pawn

      expect(pawn.promotable?(0, 6)).to eq(false)
    end
  end
end
