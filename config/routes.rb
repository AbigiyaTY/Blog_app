Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'

  resources :users do
    resources :posts do
          resources :likes
          resources :comments
    end
  end

  # root "users#index"

end
