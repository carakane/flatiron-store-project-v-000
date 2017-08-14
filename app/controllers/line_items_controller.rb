
class LineItemsController < ApplicationController

  def new
  end

  def create
    @user = current_user
    @cart = @user.current_cart ||= @user.carts.create
    # binding.pry
    @item = Item.find(line_item_params[:item_id])
    # @line_item = @cart.line_items.create(line_item_params)
    @cart.add_item(@item.id)
    @cart.save
    # binding.pry
    redirect_to cart_path(@cart)
  end

  private

    def line_item_params
      params.permit(:item_id)
    end
end
