Rails.application.routes.draw do
  root "pages#home"

  resources :users do
    resources :pins
  end

  # resources :pins do 
  #   resources :likes
  # end

  get 'users/index'
  get 'users/show'

  match '/users', to: 'users#index', via: 'get'
  match '/users/:id', to: 'users#show', via: 'get'

  devise_for :users, :path_prefix => 'd'
  resources :users, :only =>[:show]
  
  # root 'pages#home'
  get 'pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "up" => "rails/health#show", as: :rails_health_check

end
