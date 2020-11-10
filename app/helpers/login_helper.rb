module LoginHelper
  def log_in(organization)
    session[:organization_id] = organization.id
  end

  def current_organization
    if session[:oraganization_id]
      @current_organization ||= Organization.find_by(id: session[:organization_id])
    end
  end

  def current_organization?(organization)
    organization == current_organization
  end

  def logged_in?
    !current_organization.nil?
  end

  def log_out
    session.delete(:organization_id)
    @current_organization = nil
  end

end
