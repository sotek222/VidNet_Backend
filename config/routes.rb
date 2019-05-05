Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :friends
      resources :theatres
      resources :users
      resources :messages
      resources :inboxes
      resources :texts
      resources :chats
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end

  mount ActionCable.server => '/cable'

end
