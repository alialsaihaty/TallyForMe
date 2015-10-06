class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item         = Item.new item_params
    @item.company = current_company
    @company      = @item.company
    if @item.save
      redirect_to @item, notice: "Item Created!"
    else
      flash[:alert] = "See errors below!"
      render :new
    end
  end

  def edit
    @item = Item.find params[:id]
  end

  def update
    @item = Item.find params[:id]
    if @item.update item_params
      redirect_to @item, notice: "Item Updated!"
    else
      flash[:alert] = "See errors below!"
      render :edit
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find params[:id]
  end

  def destroy
    @item = Item.find params[:id]
    @item.update
    redirect_to items_path, notice: "Item was successfully destroyed"
  end

  private

  def item_params
    params.require(:item).permit(:description, :sku, :qty, :price, :discount, :company_id, :item_name, :tax1, :tax2)
  end

end
