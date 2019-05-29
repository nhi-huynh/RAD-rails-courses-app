module SessionsHelper

  # Logs in the given coordinator.
  def log_in(coordinator)
    session[:coordinator_id] = coordinator.id
  end
    
  # Remembers a coordinator in a persistent session.
  def remember(coordinator)
    coordinator.remember
    cookies.permanent.signed[:coordinator_id] = coordinator.id
    cookies.permanent[:remember_token] = coordinator.remember_token
  end
  
  # Returns true if the given coordinator is the current coordinator.
  def current_coordinator?(coordinator)
    coordinator == current_coordinator
  end
  
  # Returns the current logged-in coordinator (if any).
  def current_coordinator
    if (coordinator_id = session[:coordinator_id])
      @current_coordinator ||= Coordinator.find_by(id: coordinator_id)
    elsif (coordinator_id = cookies.signed[:coordinator_id])
      coordinator = Coordinator.find_by(id: coordinator_id)
      if coordinator && coordinator.authenticated?(:remember, cookies[:remember_token])
        log_in coordinator
        @current_coordinator = coordinator
      end
    end
  end
  
  # Returns true if the coordinator is logged in, false otherwise.
  def logged_in?
    !current_coordinator.nil?
  end
  
  # Forgets a persistent session.
  def forget(coordinator)
    coordinator.forget
    cookies.delete(:coordinator_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current coordinator.
  def log_out
    forget(current_coordinator)
    session.delete(:coordinator_id)
    @current_coordinator = nil
  end
  
  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
  
end