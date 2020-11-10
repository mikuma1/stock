class LoginController < ApplicationController
  def new
    
  end
  
  def create
    organization = Organization.find_by(name: params[:login][:name])
    if organization && organization.authenticate(params[:login][:password])
      log_in organization
      redirect_to root_path(id: organization.id)
    else
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end

end
