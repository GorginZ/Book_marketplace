Rails.application.routes.draw do
  devise_for :users
  resources :listings
  resources :categories
  get '/index.html', to: 'categories#index'
  get '/my_listings', to: 'listings#my_listings'
  root to: "pages#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
