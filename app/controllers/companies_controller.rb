class CompaniesController < ApplicationController
  def new
    @company = Company.new
    @company.users.build
  end

  def show

  end

  def create
    @company = Company.new(company_params)

    if @company.save
      @company.users.find_by(params[:company_id]).update(owner: 'true')

      flash.now[:success] = "Company was successfully created."
      redirect_to root_path
    else
      flash.now[:danger] = "Could not save company"
      render :new
    end
  end

  private
  def company_params
    params.require(:company).permit(:name, :url, users_attributes: [:name, :email, :password, :owner])
  end

end
