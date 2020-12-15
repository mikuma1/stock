class ApplicationController < ActionController::Base
  include LoginHelper
  before_action :configure_permitted_parameters, if: :devise_controller?
  authorize_resource class: false

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path(params[:id])
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name organization_id admin])
  end

  def after_sign_out_path_for(resource_or_scope)
      root_path(id: @organization_id)
  end
end
