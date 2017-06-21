Rails.application.routes.draw do
  resources :portfolios

# get 'Custom-URL-HERE' to: 'Actual Route'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs
  
  root to: 'pages#home'
end
