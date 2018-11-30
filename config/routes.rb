Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'companies#new'
  resources :companies, only: [:create, :new, :edit, :show, :update, :destroy]
  resources :stores
  resources :recruits
end
