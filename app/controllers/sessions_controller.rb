class SessionsController < ApplicationController
  def login
    redirect_to dashboard_path if current_user
  end

  def create
    @company = Company.find_by(url: company_url)
    @user = User.find_by(company_id: @company.id, email: params[:email])
# аналог Олег    @user = @company.users.find_by_email(params[:email])

    if @company && @user.authenticate(params[:password])
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
#    @company = Company.find_by_url(request.subdomain)
#    @user_email = User.where(email: params[:email])
#    @company_url = Company.where(id: @user_email )
#    if params[:email]
#      @company_url = User.where(email: params[:email].downcase).map {|u| u.company.url}
#    end

    if params[:email]
      @companies_url = User.where(email: params[:email].downcase).map {|u| u.company.url}
    end
#    redirect_to dashboard_path if current_user
#    @f_company = Company.find_by_url(request.subdomain)
#    @f_company = '.' + 'avciv' + '.' + request.domain
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end

  def company_url
    request.subdomain.chomp(".avciv")
#    request.subdomain.reverse.gsub(/^vicva./,'').reverse
  end
end
