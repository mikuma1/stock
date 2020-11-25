class OrganizationsController < ApplicationController
  def index
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to root_path(id: @organization.id)
    else
      render :new
    end
  end

  private
  def organization_params
    params.require(:organization).permit(:name, :password, :password_confirmation)
  end
  
end
