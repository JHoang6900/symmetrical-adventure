Rails.application.routes.draw do
  devise_for :users, paht: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  # get 'Custom-URL-HERE' to: 'Actual Route'
  resources :portfolios, except: [:show]
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end
  
  root to: 'pages#home'
end
