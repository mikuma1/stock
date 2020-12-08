Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :users, only: %i[edit update index destroy]
  get 'users/:id', to: 'users#admin'
  resources :organizations, only: %i[new create] do
    resources :items do
      collection do
        put 'change'
      end
    end
  end
  resources :consumptions, only: :create
  resources :orders, only: [:create, :index]
  get  '/login', to: 'login#new'
  post '/login', to: 'login#create'
  delete '/logout', to: 'login#destroy'
end
