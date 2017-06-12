class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
      # If user's login doesn't work, send them back to the login form.

      # redirect_to '/login', notice: "Email or password not correct"  ## idea #1
      # flash[:notice] = 'Successfully checked in'   ## idea #2

      redirect_to '/login', notice: "Invalid email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end