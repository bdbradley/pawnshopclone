Rails.application.routes.draw do
  root "pawnshops#index"
  resources :pawnshops
end
