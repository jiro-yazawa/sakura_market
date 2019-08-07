class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :admin_user, only: [:new, :create, :destoroy]

  def index
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to new_item_url, notice: "商品「#{@item.name}」を登録しました。"
    else
      render :new, notice: "商品の登録に失敗しました。"
    end
  end

  def destroy

  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :description, :hidden, :display_order)
  end

  def admin_user
    if !current_user.admin?
      redirect_to root_url
    end
  end

end
