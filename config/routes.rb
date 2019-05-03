Rails.application.routes.draw do
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
    end
  end
  
  resources :categories do
    member do
      get :courses_category
    end
  end
  
  
end
