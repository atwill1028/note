class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :get_category
  before_action :get_current_user_id, if: :user_signed_in?
  before_action :get_current_user_image, if: :user_signed_in?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  protected

  def get_category
    @category = params[:controller]
  end

  def get_current_user_id
    @current_user_id = current_user.id
  end

  def get_current_user_image
    @current_user_image=current_user.image
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname], keys: [:agreement])
  end
end
