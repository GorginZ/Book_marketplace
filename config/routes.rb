Rails.application.routes.draw do
  devise_for :users
  resources :listings
  resources :categories
  resources :orders
  get '/index.html', to: 'categories#index'
  get '/my_listings', to: 'listings#my_listings'
  get '/search' => 'pages#search', :as => 'search_page'
  get "/payments/session", to: "payments#get_stripe_id"
  get '/my_orders', to: 'orders#my_orders'

  # get '/show', to: 'categories#show'
  root to: "pages#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
