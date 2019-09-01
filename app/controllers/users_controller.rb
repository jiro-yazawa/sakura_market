class UsersController < ApplicationController
  before_action :set_user

  def edit
  end

  def update
    if @user.update!(user_params)
      redirect_to edit_user_url, notice: 'ユーザー情報を更新しました。'
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :image)
  end
end
