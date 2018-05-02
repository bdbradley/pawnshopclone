require 'rails_helper'

RSpec.describe Queen, type: :model do
  describe '#valid_move?' do
    let(:queen) { FactoryBot.create :queen, x_position: 2, y_position: 2, is_white: true }

    it 'is successful to up/right' do
      expect(queen.valid_move?(5, 5)).to eq true
    end

    it 'is successful to down/left' do
      expect(queen.valid_move?(1, 1)).to eq true
    end

  end
end
