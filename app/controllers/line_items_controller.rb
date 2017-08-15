class LineItemsController < ApplicationController

  def create
    @user = current_user
    @cart = @user.current_cart ||= @user.carts.create
    @item = Item.find(line_item_params[:item_id])
    @cart.add_item(@item.id)
    @cart.save
    redirect_to cart_path(@cart)
  end

  private

    def line_item_params
      params.permit(:item_id)
    end
end
