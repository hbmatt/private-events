Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :events, only: [:new, :create, :index, :show]
  resources :invitations, only: [:new, :create, :show]

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  post 'invitations/:id/accept', to:'invitations#accept', as: :accept

  root 'sessions#new'
end
