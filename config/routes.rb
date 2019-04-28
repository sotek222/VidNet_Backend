Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :friends
      resources :theatre_users
      resources :theatres
      resources :users
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end

  mount ActionCable.server => '/cable'

end
