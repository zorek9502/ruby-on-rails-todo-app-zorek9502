class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Devise::Controllers::Helpers

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :description])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :description, :avatar])
  end
end
