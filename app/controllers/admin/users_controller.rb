class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    @user.update!(user_params)
    redirect_to admin_users_url, notice: "ユーザー「#{@user.name}」の情報を更新しました。"
  end

  def destroy
    @user.destroy!
    redirect_to admin_users_url, notice: "ユーザーを削除しました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
