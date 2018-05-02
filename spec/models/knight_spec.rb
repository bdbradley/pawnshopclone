require 'rails_helper'

RSpec.describe Knight, type: :model do
  describe '#valid_move?' do
    let(:knight) { FactoryBot.create :knight, x_position: 2, y_position: 2, is_white: true }

    it 'is successful to up/right' do
      expect(knight.valid_move?(3, 4)).to eq true
    end

    it 'is successful to down/left' do
      expect(knight.valid_move?(2, 4)).to eq true
    end
  end
end
