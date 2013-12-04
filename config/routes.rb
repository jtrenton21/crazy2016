Elvis::Application.routes.draw do
  resources :eventdays


  resources :articles


  resources :users
  resources :sessions

  resources :events
  resources :contents do
     collection do
      match 'search' => 'contents#search', via: [:get, :post], as: :search
     end
  end

  resources :visits

  root to: 'static_pages#home'
  
  match '/calendar',    to: 'events#calendar',          via: 'get'
  match '/schedule',    to: 'events#schedule',          via: 'get'
  match '/gallery',     to: 'contents#gallery',         via: 'get'
  match '/post',        to: 'contents#post',            via: 'get'
  match '/template',    to: 'static_pages#template',    via: 'get'
  match '/merchandise', to: 'static_pages#merchandise', via: 'get'
  match '/contact',     to: 'static_pages#contact',     via: 'get'
  match '/news',        to: 'articles#index',           via: 'get'
  match '/ticket',      to: 'static_pages#ticket',      via: 'get'
  match '/home',        to: 'static_pages#home',        via: 'get'
  match '/about',       to: 'static_pages#about',       via: 'get'
  match '/eventinfo',   to: 'static_pages#eventinfo',   via: 'get'
  match '/partner',     to: 'static_pages#partner',     via: 'get'
  
  match '/signup',      to: 'users#new',                via: 'get'
  match '/admin',       to: 'users#admin',              via: 'get'
  match '/dashboard',   to: 'users#dashboard',          via: 'get'

  get 'login',          to: 'sessions#new',              as: 'login'
  get 'logout',         to: 'sessions#destroy',          as: 'logout'
 

  # The priority is based upon order of creation:
  # first created -> highest priority.
  
  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
