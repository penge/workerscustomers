Rails.application.routes.draw do
  
  get  'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  
  get 'profile/:id', to: 'users#show', as: 'profile'
  get 'profile/:id/edit', to: 'users#edit', as: 'edit_profile'

  get 'home', to: 'pages#home'
  root to: 'pages#home'

  resources :users
  resources :sessions
  resources :skills
end
