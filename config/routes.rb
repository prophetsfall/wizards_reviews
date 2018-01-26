Rails.application.routes.draw do
  get '/', to: 'static_views#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :wizards, only: [:index, :show, :create, :update]
      resources :users, only: [:index]
      resources :reviews, only: [:create, :update]
    end
  end

  get '*path', to: 'static_views#index'
end
