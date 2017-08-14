class LineItemsController < ApplicationController

  def new
  end

  def create
    @user = current_user
    @cart = @user.current_cart
    # binding.pry
    redirect_to cart_path(@cart)
  end
end
