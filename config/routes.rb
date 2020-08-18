Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :events, only: [:new, :create, :index, :show]

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  root 'sessions#new'
end
