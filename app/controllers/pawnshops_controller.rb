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
      @pawn = Pawn.create(pawn_params)
      redirect_to root_path

    end

    private

    def pawn_params
      params.require(:pawn).permit(:name)
      
    end
  
  
end
