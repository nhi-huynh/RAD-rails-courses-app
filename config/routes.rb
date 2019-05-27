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
  
  get 'contact-me', to: 'messages#new', as: 'new_message'
post 'contact-me', to: 'messages#create', as: 'create_message'

  get  '/contact', to: 'application#contact'
  get  '/coordinators',    to: 'coordinator#index'
  get  '/courses',    to: 'courses#index'
  get  '/admin', to: 'application#admin'
  get "/404", to: "errors#not_found"

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
   get    '/login',   to: 'sessions#new'
   post   '/login',   to: 'sessions#create'
   delete '/logout',  to: 'sessions#destroy'
  
  
#   CarrierWaveExample::Application.routes.draw do
#   courses :courses, only: [:index, :newFile, :createFile, :destroyFile]
#   root "courses#edit"
# end
  
  
  
# make sure this rule is the last one
 
# map.connect '*path', :controller => 'application', :action => 'rescue_404' unless ::ActionController::Base.consider_all_requests_local

get '*path' => proc { |env| Rails.env.development? ? (raise ActionController::RoutingError,
%{No route matches "#{env["PATH_INFO"]}"}) : ApplicationController.action(:render_not_found).call(env) }


end
