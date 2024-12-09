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
resources :profiles, only: %i[index new create show edit update]
# resources :addresses, only: [:new, :create, :edit, :update, :show]
resources :products
resources :delivery_details, only: %i[new create]
# resources :profiles do
#   resources :addresses, only: [:new, :create, :index]
# end
resources :profiles do
  resources :addresses
end

root "products#index"
end
