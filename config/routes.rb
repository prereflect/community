Rails.application.routes.draw do
  root 'welcome#index'

  get '/register', to: 'users#new'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  get '/signout', to: 'sessions#destroy'

  resources :welcome, only: [:index]
  resources :users
end
