class CartsController < ApplicationController

  def show
    # binding.pry
    @user = current_user
    @current_cart = @user.current_cart
  end
end
