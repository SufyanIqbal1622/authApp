class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected


  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access denied. You are not authorized to access the requested page."
    redirect_to root_path
   end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id])
  end

  def self.permission
    return name = self.name.gsub("Controller","").singularize.split("::").last.constantize.name rescue nil
  end

  def current_ability
    @current_ability ||= Ability.new current_user
  end

  def load_permissions
    @current_permissions = current_user.role.permissions.collect{|p| [p.subject_class, p.action]}
  end
end
