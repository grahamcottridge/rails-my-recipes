Rails.application.routes.draw do
  root to: 'pages#home'
  get 'pages/home', to: 'pages#home'
end