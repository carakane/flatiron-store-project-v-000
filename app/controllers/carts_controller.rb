class CartsController < ApplicationController

  def show
    @user = current_user
    if @user.current_cart
      @cart = @user.current_cart
    end
  end

  def checkout
    @user = current_user
    @cart = @user.current_cart
    @cart.status = "submitted"
    @cart.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    Order.create(total: @cart.total, cart_id: @cart.id, user_id: @user.id, status: "submitted")
    @user.current_cart = nil
    redirect_to cart_path(@cart)
  end
end
