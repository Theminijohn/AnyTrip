class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  # layout :layout_by_resource

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [ :first_name, :last_name ]
    devise_parameter_sanitizer.for(:account_update) << [ :first_name, :last_name ]
  end

  def layout_by_resource
    if devise_controller?
      'devise_layout'
    elsif devise_controller? && action_name == "edit"
      "application"
    else
      "application"
    end
  end

end
