class User < ActiveRecord::Base
  has_secure_password
  has_many :carts
  belongs_to :current_cart, class_name: 'Cart', foreign_key: 'cart_id'

end
