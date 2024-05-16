Rails.application.routes.draw do
  root "rooms#index"

  resources :rooms do 
    resources :messages
  end

  get 'users/index'
  get 'users/show'

  match '/users', to: 'users#index', via: 'get'
  match '/users/:id', to: 'users#show', via: 'get'

  devise_for :users, :path_prefix => 'd'
  resources :users, :only =>[:show]
  
  # root 'pages#home'
  get 'pages/home'

  get "up" => "rails/health#show", as: :rails_health_check
end
