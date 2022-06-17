Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts do
      resources :comments, only: [:create, :destroy, :edit]
      resources :likes, only: [:create, :destroy]
    end
  end

  namespace :api, defaults: { format: :json } do
    resources :posts, only: [:index] do
      resources :comments, only: [:create, :index]
    end
  end

  # Defines the root path route ("/")
  root "users#index"
end
