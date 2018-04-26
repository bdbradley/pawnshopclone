Rails.application.routes.draw do

    root 'games#index'

    
    resources :games do
    	patch 'forfeit', on: :member
  	end
    resources :pieces, only: [:show, :update]

    
  devise_for :users

  

    
    

end

    

    
    
    
    
    
      
    

    

    
   

  

