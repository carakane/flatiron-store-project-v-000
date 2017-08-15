class StoreController < ApplicationController

  def index
    @categories = Category.all
    @items = Item.available_items
    if current_user
      @user = current_user
      if @user.current_cart
        @cart = @user.current_cart
      end
    end
  end

end
