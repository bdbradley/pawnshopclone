Rails.application.routes.draw do

    root 'pawnshops#index'

    
    resources :games
    resources :pieces, only: [:update]

    
  devise_for :users

  

    
    

end

    

    
    
    
    
    
      
    

    

    
   

  

