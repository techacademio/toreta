Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'signup', to: 'companies#new'
  resources :companies, only: [:show, :new, :create]
end
