class SessionsController < ApplicationController

  def new
  end

  def create
    coordinator = Coordinator.find_by(email: params[:session][:email].downcase)
    if coordinator && coordinator.authenticate(params[:session][:password])
      # if coordinator.activated?
        log_in coordinator
        flash.now[:success] = 'Log in successfully'
        params[:session][:remember_me] == '1' ? remember(coordinator) : forget(coordinator)
        redirect_back_or coordinator
      # else
      #   message  = "Account not activated. "
      #   message += "Check your email for the activation link."
      #   flash[:warning] = message
      #   redirect_to root_url
      # end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end


