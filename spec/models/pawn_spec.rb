require 'rails_helper'

RSpec.describe Pawn, type: :model do
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
