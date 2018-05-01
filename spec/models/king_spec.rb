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
