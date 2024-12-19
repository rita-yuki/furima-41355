class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_gon

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def set_gon
    gon.some_variable = "some_value"  # 必要なデータをセットします
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']  # 必要なデータをセットします
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :name, :kana_family_name, :kana_name, :birthday])
  end
end