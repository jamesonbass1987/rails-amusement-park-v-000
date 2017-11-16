Rails.application.routes.draw do

  root 'static#index'
  resources :attractions
  resources :rides
  resources :users, only: [:new, :show, :create]

  get '/signin' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

end
