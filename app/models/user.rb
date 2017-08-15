class User < ActiveRecord::Base
  has_many :carts
  has_many :orders
  has_one :current_cart, class_name: 'Cart', foreign_key: 'user_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
