Rails.application.routes.draw do
  get '/', to: 'static_views#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :wizards, only: [:index]
      resources :reviews, only: [:index]
      resources :users, only: [:index]

    end
  end
  resources :users
  resources :wizards
  resources :reviews
end
