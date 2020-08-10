Rails.application.routes.draw do
  resources :chatrooms, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :messages, only: [:create]
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  resources :users, only: [:new, :edit, :update, :create]
  root "chatrooms#index"
end
