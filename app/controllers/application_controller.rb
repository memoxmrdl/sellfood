class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  def check_account_or_create
    if current_user.present? and current_user.account.present?
      root_url
    else
      after_signup_path(:account)
    end
  end

  def after_sign_in_path_for(user)
    check_account_or_create
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation) }
  end
end
