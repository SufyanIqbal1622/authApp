class RolesController < ApplicationController
  before_action :is_manager
  before_action :find_role, only: [:show, :edit, :update]

  def index
    @roles = Role.all
  end

  private
  def is_manager
    redirect_to root_path unless current_user.manager?
  end

  def find_role
    @role = Role.find params[:id]
  end
end
