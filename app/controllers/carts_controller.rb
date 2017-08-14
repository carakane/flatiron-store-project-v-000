class CartsController < ApplicationController

  def show
    @user = current_user
    if @user.current_cart
      # binding.pry
      @cart = @user.current_cart
    # else
    #   # binding.pry
    #   @cart = @user.carts.new
    end
  end

  def checkout
    @user = current_user
    @cart = @user.current_cart
    @cart = @user.current_cart
    @cart.status = "submitted"
    @cart.save
    @cart.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
      end
    @user.current_cart = nil
    redirect_to cart_path(@cart)
  end
end
