Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :communities, only: [:index, :create] do
    collection do
      get :search
    end
  end

  resources :profiles, only: [:new, :create, :show, :update]
  resources :cards, except: [:new, :destroy] do
    resources :comments, only: :create
  end
end

