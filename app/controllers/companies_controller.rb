class CompaniesController < ApplicationController
  def new
    @company = Company.new
    @company.users.build
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      @user_owner = User.find_by(id: @company)
      @user_owner.update(owner: 'true')

      session[:user_id] = @user_id
      flash.now[:success] = "Company was successfully created."
      redirect_to root_path
    else
      flash.now[:danger] = "Could not save company"
      render :new
    end
  end

  private
  def company_params
    params.require(:company).permit(:name, :url, users_attributes: [:id, :name, :email, :password])
  end

end
