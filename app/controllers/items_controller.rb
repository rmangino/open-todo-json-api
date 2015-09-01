class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  def index
    list = List.find(params[:list_id])
    @items = list.items
    render json: @items
  end

  def show
    render json: @item
  end

  def create
    @list = List.find(params[:list_id])

    @item = @list.items.new(item_params)

    if @item.save
      render json: @item, status: :created, location: [@list, @item]
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      head :no_content
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy

    head :no_content
  end

private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :complete)
  end
end
