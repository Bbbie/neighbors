Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'pages#home'

  resources :communities, only: [:index, :create] do
    collection do
      get :search
    end
  end

  resources :profiles, only: [:new, :create, :show, :update]
  resources :cards, except: [:new, :destroy] do
    member do
      get :archive
    end
    resources :comments, only: :create
    resources :card_recipients, only: :create
  end
end

