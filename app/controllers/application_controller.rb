class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_params, if: :devise_controller?

  protected

  def update_allowed_params
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :photo, :bio) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password, :photo, :bio)
    end
  end
end
