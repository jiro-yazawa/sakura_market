class Admin::AddressesController < ApplicationController
  before_action :set_address

  def show
  end

  def edit
  end

  def update
    @address.update(user_address_params)
    redirect_to admin_users_url, notice: "ユーザー「#{@address.name}」の配送先情報を更新しました。"
  end

  def destroy
  end

  private
  
  def user_address_params
    params.require(:address).permit(:user_id, :name, :location)
  end

  def set_address
    @address = User.find(params[:user_id]).address
  end
end
