Rails.application.routes.draw do
  root 'welcome#index'

  get '/register', to: 'users#new'

  resources :welcome
  resources :users
end
