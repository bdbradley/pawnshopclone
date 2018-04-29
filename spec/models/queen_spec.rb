require 'rails_helper'

RSpec.describe Queen, type: :model do

      it "does a valid move" do 
          Queen.create(x_position: 2, y_position: 2)
          queen = Queen.last
          expect(queen.move_piece!(5,5)).to be_truthy
      end

      it "does a valid move" do 
          Queen.create(x_position: 2, y_position: 2)
          queen = Queen.last
          expect(queen.move_piece!(3,4)).to be_falsey
      end 
    end
