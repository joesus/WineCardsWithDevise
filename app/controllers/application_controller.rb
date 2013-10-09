class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_signup_params, if: :devise_controller?
  before_filter :configure_update_params, if: :devise_controller?

  
  protected

  def configure_signup_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
  end

  def configure_update_params
    devise_parameter_sanitizer.for(:account_update) do |u|
    u.permit(:name, :email, :password, :password_confirmation, :current_password)
    end
  end

  def after_sign_in_path_for(user)
  	user_path(user)
  end

  def after_update_path_for(user)
    user_path(user)
  end

  # Adds the posibility to have more than one flash of a given type
  def flash_message(type, text)
    flash[type] ||= []
    flash[type] << text
  end
end
