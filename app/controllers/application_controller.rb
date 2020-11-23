class ApplicationController < ActionController::Base
  include LoginHelper
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_organization, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :organization_id])
  end

  def set_organization
    if user_signed_in?
      @organization = Organization.find(current_user.organization_id)
    elsif params[:id]
      @organization = Organization.find(params[:id])
    else
      redirect_to login_path
    end
  end
end
