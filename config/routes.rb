Rails.application.routes.draw do

    root 'pawnshops#index'

    
    resources :games do
    	patch 'forfeit', on: :member
  	end
    resources :pieces, only: [:update]

    
  devise_for :users

  

    
    

end

    

    
    
    
    
    
      
    

    

    
   

  

