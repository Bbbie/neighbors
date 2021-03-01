Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :communities, only: [:index, :search]
  resources :cards, except: [:new, :destroy]
end
