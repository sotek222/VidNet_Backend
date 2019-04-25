Rails.application.routes.draw do
  resources :friends
  resources :theatre_users
  resources :theatres
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
