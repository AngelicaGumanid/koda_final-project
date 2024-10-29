class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_home_path
    else
      client_home_path
    end
  end
end
