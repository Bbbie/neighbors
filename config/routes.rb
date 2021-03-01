Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :communities, only: :index do
    collection do
      get :search
    end
  end

  resources :profiles, only: [:show, :edit, :update]
  resources :cards, except: [:new, :destroy]
end

