class Admin::AddressesController < ApplicationController
  before_action :set_address

  def edit
  end

  def update
    if @address.update(user_address_params)
      redirect_to admin_users_url, notice: "ユーザー「#{@address.name}」の配送先情報を更新しました。"
    else
      render :edit, notice: "配送先情報の更新に失敗しました。"
    end
  end

  private

  def user_address_params
    params.require(:address).permit(:name, :location)
  end

  def set_address
    @address = User.find(params[:user_id]).address
  end
end
