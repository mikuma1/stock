class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
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

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
