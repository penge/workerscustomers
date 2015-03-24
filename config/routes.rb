Rails.application.routes.draw do
  
  get  'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  get 'home', to: 'pages#home'
  root to: 'pages#home'

  resources :users
  resources :sessions
  resources :skills
end
