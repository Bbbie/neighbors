Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :communities, only: :index do
    collection do
      get :search
    end
  end
  resources :cards, except: [:new, :destroy]

end
