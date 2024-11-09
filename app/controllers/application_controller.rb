class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  private

  def basic_auth
   authenticate_or_request_with_http_basic do |username, password|
     username == 'admin' && password == '2222'
   end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :name, :kana_family_name, :kana_name, :birthday])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end
