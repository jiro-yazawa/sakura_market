class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_address

  def edit
    @address = current_address
  end

  def update
    @address.update!(address_params)
    redirect_to root_url, notice: "配送情報を編集しました。"
  end

  private

  def address_params
    params.require(:address).permit(:name, :location)
  end

  def set_address
    @address = current_address
  end
end
