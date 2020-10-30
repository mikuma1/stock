Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :users, only: [:edit, :update, :index]
  get "users/:id", to: 'users#admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
