class PagesController < ApplicationController

  def index
  end

  def dashboard
    if request.subdomain == "avciv"
      redirect_to root_path
    end

#      redirect_to root_url(subdomain: 'www')
#    end

#    if @company.count > 0
#      @company = @company.first
#    elsif request.subdomain != 'www'
#      redirect_to root_url(subdomain: 'www')
#    end
  end

end
