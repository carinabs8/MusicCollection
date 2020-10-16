# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  layout "sign_up"
  before_action :configure_sign_up_params, only: [:create]

  protected
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :role])
  end
end
