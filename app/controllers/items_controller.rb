class ItemsController < ApplicationController
  def index
    @items=Item.all.order('name ASC')
    @item=Item.new
  end
  def show
    @item=Item.find(params[:id])
  end

  def new
    @item=Item.new
  end

  def edit
    @item=Item.find(params[:id])
  end

  def create
    #render plain: params.inspect
    @item=Item.new(item_params) #instance variable to hold a refernce to the article object
    if @item.save  #saving the model in the database
      redirect_to items_path
    else
      @items=Item.all.order('name ASC')
      render 'items/index'
    end


  end

  def update
    #render plain: params.inspect
    @item=Item.find(params[:id])
    if @item.update(item_params)
       redirect_to items_path
    else
      render 'edit'
    end
  end

  def destroy
    @item=Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    if params[:item]
      params.require(:item).permit(:name,:details)
    else
      params.permit(:name,:details)
    end

  end
end
