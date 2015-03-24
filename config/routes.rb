Rails.application.routes.draw do
  
  get  'register', to: 'users#new'
  post 'register', to: 'users#create'
  
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  get 'home', to: 'pages#home'
  root to: 'pages#home'

  resources :users
  resources :sessions
  resources :skills
end
