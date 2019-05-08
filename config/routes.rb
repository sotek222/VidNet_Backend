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
      get '/filtered', to: 'theatres#filtered_theatres'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      post '/get_my_friends', to: 'friends#filtered'
    end
  end

  mount ActionCable.server => '/cable'

end
