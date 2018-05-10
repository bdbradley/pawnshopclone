Rails.application.routes.draw do

    root 'pawnshops#index'

    
    resources :games do
      patch 'forfeit', on: :member
      resources :pieces, only: [:show, :create, :update]
		end

    
  devise_for :users

end

    

    
    
    
    
    
      
    

    

    
   

  

