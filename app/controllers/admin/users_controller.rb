class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destory]
  def index
    @users = User.all
  end

  def show
  end

  def edit
    render 'users/registrations/edit'
  end

  def update
    @user.update!(user_params)
  end

  def destroy
    @user.destroy!
    redirect_to admin_users_url, notice: "ユーザーを削除しました。"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
