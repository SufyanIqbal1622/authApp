class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access denied. You are not authorized to access the requested page."
    redirect_to root_path
   end

  protected

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
