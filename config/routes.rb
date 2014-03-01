Elvis::Application.routes.draw do
  
  # resources :orders 
    
  # resources :orders do
  #   get 'express', :on => :collection
  # end

  # get 'cart' => 'carts#show', :as => 'current_cart'

  # match 'cart' => 'carts#show', :via => :get, :as => :current_cart, :id => 'current'
  resources :tickets
  resources :payments
  resources :products
  resources :categories
  resources :slides
  resources :eventdays
  resources :articles
  resources :visits
  resources :users
  resources :sessions
  resources :events
 
  resources :contents do
     collection do
      match 'search' => 'contents#search', via: [:get, :post], as: :search
     end
  end

  root to: 'static_pages#home'
  
  match '/calendar',    to: 'events#calendar',          via: 'get'
  match '/schedule',    to: 'events#schedule',          via: 'get'
  match '/gallery',     to: 'contents#gallery',         via: 'get'
  match '/post',        to: 'contents#post',            via: 'get'
  match '/template',    to: 'static_pages#template',    via: 'get'
  match '/merchandise', to: 'static_pages#merchandise', via: 'get'
  match '/contact',     to: 'static_pages#contact',     via: 'get'
  match '/news',        to: 'articles#index',           via: 'get'
  
  match '/home',        to: 'static_pages#home',        via: 'get'
  match '/about',       to: 'static_pages#about',       via: 'get'
  match '/eventinfo',   to: 'static_pages#eventinfo',   via: 'get'
  match '/partner',     to: 'static_pages#partner',     via: 'get'
  match '/donations',   to: 'products#index',          via: 'get'
  match '/signup',      to: 'users#new',                via: 'get'
  match '/admin',       to: 'users#admin',              via: 'get'
  match '/dashboard',   to: 'users#index',               as: "user_root"            

  get 'login',          to: 'sessions#new',              as: 'login'
  get 'logout',         to: 'sessions#destroy',          as: 'logout'
 
end
