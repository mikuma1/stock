Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :users, only: [:edit, :update, :index]
  get "users/:id", to: 'users#admin'
  resources :organizations, only: [:new, :create] do
    resources :items, only: [:index, :new, :create, :show]
  end
  get  '/login', to: 'login#new'
  post '/login', to: 'login#create'
  delete '/logout', to: 'login#destroy'
end
