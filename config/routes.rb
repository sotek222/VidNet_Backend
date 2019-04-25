Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :friends
      resources :theatre_users
      resources :theatres
      resources :users
    end
  end
end
