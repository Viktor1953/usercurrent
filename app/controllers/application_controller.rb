class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :secret_clearance

  def secret_clearance
    session[:clearance].presence || false
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :role, :rank])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

end
