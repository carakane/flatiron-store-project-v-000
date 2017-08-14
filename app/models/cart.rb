class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
  # belongs_to :current_carts, class_name: 'User', foreign_key: 'user_id'

# number_to_currency(((line_item.item.price)/100)(line_item.quantity))


  def total
    x = 0
    # binding.pry
self.line_items.each do |l|
  q = l.quantity
  i = Item.find(l.item_id)
  p = i.price
  x += p*q
end
    # self.items.each do |item|
    #
    #   x += item.price
    # end
    x
  end

  def add_item(item)
    # if self.line_items.include?(item_id: item)
    #   self.line_items.quantity += 1
    # else
    #   self.line_items.new(item_id: item)
    # end
    # if LineItem.where(cart_id: self.id, item_id: item).present?
    #   # binding.pry
    #   a = LineItem.where(cart_id: self.id, item_id: item)
    #   a.first.quantity += 1
    #   a.first.save
    #   a.first
    if self.line_items.where(item_id: item).present?
      # binding.pry
      a = self.line_items.where(item_id: item)
      a.first.quantity += 1
      a.first.save
      a.first


    else
      self.line_items.new(item_id: item)
    end
  end
end

#
# .find_or_create_by
# .includes
# LineItem.where(cart_id: c.id)
