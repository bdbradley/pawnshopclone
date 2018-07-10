class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  

  protect_from_forgery with: :exception	

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      games_path
    else
      super
    end
  end

  def after_sign_up_path_for(resource)
    if resource_or_scope.is_a?(User)
      games_path
    else
      super
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end



  
  

  


