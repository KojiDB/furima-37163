class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :category_id, :item_conditions_id,
                                 :area_id, :postage_fee_id, :postage_day_id, :image).merge(user_id: current_user.id)
  end

end
