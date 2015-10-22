class UsersController < ApplicationController
  def new
    @user = User.new
    if request.subdomain == "avciv"
      redirect_to root_path
    end
  end

  def create
    @user = current_user.company.users.build(user_params)
    if @user.save
      flash.now[:success] = "User was successfully created."
      redirect_to dashboard_path
    else
      flash.now[:danger] = "Could not save user"
      redirect_to :back
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
