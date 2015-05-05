Rails.application.routes.draw do
  root 'posts#index'

  get '/register', to: 'users#new'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  get '/signout', to: 'sessions#destroy'

  resources :users
  resources :posts do
    resources :comments, only: [:create]
  end
end
