class UsersController < ApplicationController

  #always the form, the way it looks
  def new
    @user = User.new
  end

  def create
    @user = User.new(form_params)

    # check if user can save_and _subscribe (custom)> see model
    if @user.save_and_subscribe
      #keep hold of that user
      session[:user_id] = @user.id

      #let the user know they've signed up
      flash[:success] = "Welcome to Source!"

      redirect_to root_path
    else
      render 'new'
    end
  end

  def form_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :subscription_plan, :stripe_token)
  end

end
