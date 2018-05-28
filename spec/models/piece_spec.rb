require 'rails_helper'

RSpec.describe Piece, type: :model do

describe '#off_board?' do
    let(:piece) { FactoryBot.create :piece, x_position: 1, y_position: 9, is_white: true }
      
    it 'returns true if piece off_board' do
      expect(piece.off_board?(1, 9)).to eq true

      expect(piece.off_board?(2, 3)).to eq false
    end
  end
end