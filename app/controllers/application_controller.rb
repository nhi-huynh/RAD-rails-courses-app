class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   include SessionsHelper
   
  # GET /home
  # GET /home.json
  def index
    @categories = Category.all
    @locations = Locations.all
  end
  
end
