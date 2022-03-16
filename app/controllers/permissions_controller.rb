class PermissionsController < ApplicationController
  load_and_authorize_resource
  before_action :load_permissions
  before_action :set_permission, only: %i[ show edit update destroy ]


  def new
    @permission = Permission.new
    @roles = Role.all.order(name: :asc)
  end

  def edit
    @roles = Role.all.order(name: :asc)
  end

  def create
    @permission = Permission.new(permission_params)

    respond_to do |format|
      if @permission.save
        format.html { redirect_to roles_path, notice: "permission was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @permission.update(permission_params)
        format.html { redirect_to roles_path, notice: "permission was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @permission.destroy

    respond_to do |format|
      format.html { redirect_to permissions_url, notice: "permission was successfully destroyed." }
    end
  end

  private
    def set_permission
      @permission = Permission.find(params[:id])
    end

    def permission_params
      params.require(:permission).permit(:subject_class, :action, :role_id)
    end
end
