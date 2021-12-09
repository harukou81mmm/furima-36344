class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    #if @item.user_id == current_user.id && @item.order.nil?
    #else
      #redirect_to root_path
    #end
  end

  def destroy
    #if @item.user_id == current_user.id
      #@item.destroy
      #redirect_to root_path
    #else
      #redirect_to root_path
    #end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :item_condition, :category_id, :status_id, :shopping_charges_id,
                                 :shopping_area_id, :day_id, :price).merge(user_id: current_user.id)
  end
end
