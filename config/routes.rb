Rails.application.routes.draw do
  get '/', to: 'static_views#index'

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :wizards, only: [:index, :show, :destroy]
      resources :users, only: [:index]
      resources :reviews, only: [:create, :update, :destroy]
      resources :votes, only: [:create, :update]
    end
  end

  resources :wizards
  resources :reviews, only: [:destroy]
  resources :users, only: [:index, :destroy]
  get '*path', to: 'static_views#index'

end
