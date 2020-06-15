class UsersController < ApplicationController

  #always the form, the way it looks
  def new
    @user = User.new
  end

  def create
    @user = User.new(form_params)

    # check if user can save
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def form_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

end
