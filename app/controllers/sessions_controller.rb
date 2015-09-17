class SessionsController < ApplicationController
  def login
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      redirect_to :back
    end
  end

  def logout
    # session[:user_id] = nil
    reset_session
    redirect_to root_url(:host => 'avciv' + '.' + request.domain)
  end

  def header_sign_in
  end

  def find_company
    @user_email = User.where(email: params[:email])
    @company_url = Company.where(id: @user_email )
    @f_company = '.' + 'avciv' + '.' + request.domain
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end

end
