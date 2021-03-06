class UsersController < ApplicationController
  before_action :set_organization, expect: :destroy

  def index
    @users = User.where(organization_id: params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      @user = current_user
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    redirect_to users_path(id: user.organization_id)
  end

  def admin
    user = User.find(params[:id])
    if user.admin
      user.update(admin: false)
    else
      user.update(admin: true)
    end
    item = User.find(params[:id])
    render json: { user: item }
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :organization_id)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  rescue StandardError
    @organization = Organization.find(current_user.organization_id)
  end
end
