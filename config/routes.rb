Rails.application.routes.draw do
 
  
  resources :lines, :trips
  root :to => "welcome#show"

  get 'welcome/show'
  
  get '/lines/:id' => 'lines#show'
  get '/lines/new' => 'lines#new'
  post '/lines' => 'lines#create'
  get '/lines/:id/edit' => 'lines#edit'
  put '/lines.:id' => 'lines#update'
  delete '/lines.:id' => 'lines#destroy'
  
  get '/trips' => 'trips#index'
  get '/trips/:id' => 'trips#show'
  get '/trips/new/newtrip' => 'trips#new'
  post '/trips' => 'trips#create'
  get '/trips/:id/edit' => 'trips#edit'
  put '/trips.:id' => 'trips#update'
  get '/trips/join/:id' => 'trips#join'
  delete '/trips.:id' => 'trips#destroy'
  put '/trips.:id' => 'trips#join', as: :join
  
  get 'auth/:provider/callback' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  get 'auth/failure' => 'sessions#failure'
  get 'auth/facebook', :as => 'login'
  
  get '/account' => 'sessions#show'
  
  resource :stops do
    get "stop"
  end
  
  resource :trips do
    resources :passengers do
    end
  end
  
end
