Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only: %i[edit update index destroy]
  get 'users/:id', to: 'users#admin'
  resources :organizations, only: %i[new create] do
    resources :items do
      collection do
        put 'change'
      end
    end
  end
  resources :consumptions, only: %i[index create]
  get 'consumptions/:consumption_id', to: 'consumptions#approval'
  resources :orders, only: :create
  get  '/login', to: 'login#new'
  post '/login', to: 'login#create'
  delete '/logout', to: 'login#destroy'
end
