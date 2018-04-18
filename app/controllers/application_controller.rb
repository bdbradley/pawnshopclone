class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :game 

  def available
  	Game.where(black_player_id: nil).where.not(white_player_id: current_user.id).first(10)
  end 

  def in_progress

  end 

  def ended 

  end  

end
