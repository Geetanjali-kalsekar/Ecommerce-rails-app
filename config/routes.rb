Rails.application.routes.draw do
  # get "delivery_details/new"
  # get "delivery_details/create"
  # get "addresses/new"
  # get "addresses/create"
  # get "addresses/edit"
  # get "addresses/update"
  # get "addresses/show"
  # get "profiles/new"
  # get "profiles/create"
  # get "profiles/edit"
  # get "profiles/update"
  # devise_for :users
  devise_for :users

  root "products#index"

  resources :users, only: [:show] do
    resources :addresses, only: %i[index new create edit update show]
    resources :profiles, only: %i[show edit update new create]
  end

  resources :products
  resources :delivery_details, only: %i[new create]
end

