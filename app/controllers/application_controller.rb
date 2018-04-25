class ApplicationController < ActionController::Base
  

  protect_from_forgery with: :exception	

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      games_path
    else
      super
    end
  end


  
  

  

end
