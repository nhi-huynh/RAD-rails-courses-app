Rails.application.routes.draw do
  resources :locations do
    member do
      get :courses_hosted
      
    end
  end
  
  resources :categories
  
  resources :courses do
    member do
      get :locations
      post :location_add
      post :location_remove
    end
  end
    
  resources :coordinators
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
