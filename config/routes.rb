Rails.application.routes.draw do
  root to: 'item#index'
  devise_for :users
<<<<<<< Updated upstream
  resources :users, only: [:edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
=======
  resources :users, only: [:edit, :update, :index, :destroy]
  get "users/:id", to: 'users#admin'
  resources :organizations, only: [:new, :create] do
    resources :items
  end
  get  '/login', to: 'login#new'
  post '/login', to: 'login#create'
  delete '/logout', to: 'login#destroy'
>>>>>>> Stashed changes
end
