Rails.application.routes.draw do
  root to: 'pages#home'
  get 'pages/home', to: 'pages#home'

  resources :recipes

  get '/signup', to: 'chefs#new'
  resources :chefs, except: [ :new ]

end
