class ApplicationController < ActionController::Base


  #expose this to controllers AND VIEWS
  helper_method :current_user
  helper_method :is_logged_in?

  #run this on every single page and Action
  before_action :current_user

  def current_user
    #if the user is logged in
    if is_logged_in?
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end

    #return something back to user
    @current_user
  end

  def is_logged_in?
    session[:user_id].present?
  end

  #if they are not logged in, redirect them to the log in page
  def force_login
    unless is_logged_in?
      flash[:error] = "You are not logged in"
      redirect_to new_user_path
    end
  end

end
