Rails.application.routes.draw do
  # get '/chatroom', to: 'chatroom#index'
  # get '/chatroom/:id', to: 'chatroom#show'
  resources :chatrooms, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :messages, only: [:create]
  end
  # post "chatroom/:chatroom_id/message", to: "messages#create"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  # get '/users', to: 'users#new'
  # post '/users', to: 'users#create'
  resources :users, only: [:new, :edit, :update, :create]
  root "chatrooms#index"
end
