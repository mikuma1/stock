class ApplicationController < ActionController::Base
  include LoginHelper
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :organization_id])
  end

  def logged_in_user
    unless logged_in?
      redirect_to login_url
    end
  end
end
