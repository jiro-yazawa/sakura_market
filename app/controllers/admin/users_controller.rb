class Admin::UsersController < ApplicationController
  before_action :admin_user
  before_action :set_user, only: [:show, :edit, :update, :destory]
  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    @user.update!(user_params)
  end

  def destroy
    @user.destroy!
    redirect_to admin_users_url, notice: "ユーザーを削除しました。"
  end

  private

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:name, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
