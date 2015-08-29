class ListsController < ApplicationController
  before_action :set_list, only: [:show, :update, :destroy]

  def index
    @lists = List.all

    render json: @lists
  end

  def show
    render json: @list
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user

    if @list.save
      render json: @list, status: :created, location: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def update
    if @list.update(list_params)
      head :no_content
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy

    head :no_content
  end

private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title)
  end
end
