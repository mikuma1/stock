class UsersController < ApplicationController
<<<<<<< Updated upstream
=======
  before_action :set_organization, expect: :destroy

  def index
    @users = User.where(organization_id: params[:id])
  end
>>>>>>> Stashed changes

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

<<<<<<< Updated upstream
=======
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
    render json:{ user: item }
  end

>>>>>>> Stashed changes
  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
