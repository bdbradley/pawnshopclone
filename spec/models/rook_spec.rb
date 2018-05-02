require 'rails_helper'

RSpec.describe Rook, type: :model do
  describe '#valid_move?' do
    let(:rook) { FactoryBot.create :rook, x_position: 2, y_position: 2, is_white: true }

    it 'is successful to up/right' do
      expect(rook.valid_move?(2, 4)).to eq true
    end

    it 'is successful to down/left' do
      expect(rook.valid_move?(3, 3)).to eq true
    end
  end
end
