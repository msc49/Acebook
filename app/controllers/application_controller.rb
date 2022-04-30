class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  include Pagy::Backend
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, 
    if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { 
      |u| u.permit(:email, :password, :password_confirmation,:username) 
    }

    devise_parameter_sanitizer.permit(:account_update) { 
      |u| u.permit(:avatar, :email, :password, :password_confirmation, :current_password, :username) 
    } 
  end
end
