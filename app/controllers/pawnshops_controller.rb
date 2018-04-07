class PawnshopsController < ApplicationController
    def index
      @pawns = Pawn.all
    end

    def new
      @pawn = Pawn.new
    end

    def show
    end

    def create
      Pawn.create(pawn_params)

    end

    private

    def pawn_params
      params.require(:pawn).permit(:name)
      
    end
  
  
end
