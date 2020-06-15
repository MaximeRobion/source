class ApplicationController < ActionController::Base


  #expose this to controllers AND VIEWS
  helper_method :current_user

  #run this on every single page and Action
  before_action :current_user

  def current_user
    #if the user is logged in
    if session[:user_id].present?
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end

    #return something back to user
    @current_user
  end



end
