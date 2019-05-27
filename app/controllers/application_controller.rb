class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   include SessionsHelper
   



  def self.rescue_errors
    rescue_from Exception, :with => :render_error
    rescue_from RuntimeError, :with => :render_error
    rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    rescue_from ActionController::RoutingError, :with => :render_not_found
    rescue_from ActionController::UnknownController, :with => :render_not_found
    rescue_from ActionController::UnknownAction, :with => :render_not_found
  end

  rescue_errors unless Rails.env.development?

  def render_not_found(exception = nil)
    render :file => "/public/404.html", :status => 404
  end

  def render_error(exception = nil)
    render :file => "/public/500.html", :status => 500
  end
end   
  # def rescue_404
  #   rescue_action_in_public CustomNotFoundError.new
  # end

  # def rescue_action_in_public(exception)
  #   case exception
  #     when CustomNotFoundError, ::ActionController::UnknownAction then
  #       #render_with_layout "shared/error404", 404, "standard"
  #       render :template => "shared/error404", :layout => "standard", :status => "404"
  #     else
  #       @message = exception
  #       render :template => "shared/error", :layout => "standard", :status => "500"
  #   end
  # end

  # def local_request?
  #   return false
  # end
   
   
   
   

