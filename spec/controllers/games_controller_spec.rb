require 'rails_helper'

RSpec.describe GamesController, type: :controller do
    describe "games#index action" do
        it "should successfully show the page" do
            get :index
            expect(response).to have_http_status(302)

         end
    end

    describe "games#create action" do

        it "should check if user is logged in" do
			post :create
			expect(response).to redirect_to new_user_session_path
        end
        
        it "should allow user to create a game" do
			user = FactoryBot.create(:user)
			sign_in user
			post :create, game: {name: "New Chess Game"}
			expect(response).to redirect_to games_path
			g = Game.last
			expect(g.name).to eq("New Chess Game")
		end
    end


    describe 'games#show action' do
        let!(:user) { FactoryBot.create(:user) }
         let!(:user2) { FactoryBot.create(:user) }
        let!(:game) { FactoryBot.create(:game, white_player: user.id, black_player: user2.id) }
        
        it 'should successfully show the page of the game' do
            get :show, params: { id: game.id }
            expect(response).to have_http_status(:success)
        end
  
        it 'should return the number and the correct piece' do
            get :show, params: { id: game.id }
            @pieces = game.pieces
  
            expect(@pieces.count).to eq 32
        end
    end
end


   