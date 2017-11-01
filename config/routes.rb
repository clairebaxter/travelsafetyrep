Rails.application.routes.draw do
  # added this line from stackover flow to help with puts error 
  #put 'line/:id' => 'lines#update', :as => 'update_line'
  
  resources :lines
  root :to => redirect('/lines')
  
  
  get '/lines/:id' => 'lines#show'
  get '/lines/new' => 'lines#new'
  post '/lines' => 'lines#create'
  get '/lines/:id/edit' => 'lines#edit'
  put '/lines.:id' => 'lines#update'
  delete '/lines.:id' => 'lines#destroy'
  
  get  'auth/:provider/callback' => 'sessions#create'
  post 'logout' => 'sessions#destroy'
  get  'auth/failure' => 'sessions#failure'
  get  'auth/facebook', :as => 'login'
  
  #devise_for :passengers
=begin
  devise_for :passengers, :controllers => { :omniauth_callbacks => "passengers/omniauth_callbacks" }
  devise_scope :passenger do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_passenger_session
  end
  
  devise_for :passengers, :controllers => { :omniauth_callbacks => "passengers/omniauth_callbacks" }

  devise_scope :passenger do
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_passenger_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_passenger_session
  end
  
  resource :stops do
    get "stop"
  end
  #resources :stops
  #get 'stops/stops'#, :to => "stops/stop", :as => stop 
  get '/stops/:id/stop', to: 'stops#stop'
=end
  
  
  

  
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
