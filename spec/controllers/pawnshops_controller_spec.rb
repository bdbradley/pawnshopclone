require 'rails_helper'

RSpec.describe PawnshopsController, type: :controller do
    describe "pawnshops#index action" do
        it "should successfully show the page" do
            get :index
            expect(response).to have_http_status(:success)
            end
        end
    end

