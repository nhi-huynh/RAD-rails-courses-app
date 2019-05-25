Rails.application.routes.draw do
  resources :users
  resources :coordinators
  
  resources :courses do
    member do
      get :locations
      post :location_add
      post :location_remove
    end
  end
  
  resources :locations do
    member do
      get :courses_hosted
      get :coordinators_hosted
    end
  end
  
  resources :categories do
    member do
      get :courses_category
    end
  end
  
  root 'application#home'
  
  # get 'sessions/new'
  # get 'users/new'

  get  '/contact', to: 'application#contact'
  get  '/coordinators',    to: 'coordinator#index'
  get  '/courses',    to: 'courses#index'
  

  

  
  # get '/location_14_10_31', to: 'static_pages#location14.10.31'
  # get '/location_14_10_30', to: 'static_pages#location14.10.30'
  # get '/location_14_08_23', to: 'static_pages#location14.08.23'
  
  # get  '/webProgram',    to: 'static_pages#webProgram'
  # get  '/fullStackDev',    to: 'static_pages#fullStackDev'
  # get  '/iosEngineering',    to: 'static_pages#iosEngineering'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
   get    '/login',   to: 'sessions#new'
   post   '/login',   to: 'sessions#create'
   delete '/logout',  to: 'sessions#destroy'
  
  # root 'static_pages#home'
  # get  '/help',    to: 'static_pages#help'
  # get  '/about',   to: 'static_pages#about'
  # get  '/contact', to: 'static_pages#contact'
  # get  '/signup',  to: 'users#new'
  # post '/signup',  to: 'users#create'
  
end
