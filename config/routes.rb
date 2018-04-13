Rails.application.routes.draw do
  devise_for :users
  root 'pawnshops#index'
  resources :games
end

