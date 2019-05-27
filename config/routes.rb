Rails.application.routes.draw do
  get 'sessions/new'

  root 'application#home'
  
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
  
  get  '/signup',  to: 'coordinators#new'
  post '/signup',  to: 'coordinators#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get  '/admin', to: 'application#admin'
  get  '/contact', to: 'application#contact'
  
  get  '/coordinators',    to: 'coordinator#index'
  get  '/courses',    to: 'courses#index'
  
  

  

  
  # make sure this rule is the last one
  get '*path' => proc { |env| Rails.env.development? ? (raise ActionController::RoutingError, %{No route matches "#{env["PATH_INFO"]}"}) : ApplicationController.action(:render_not_found).call(env) }
end
