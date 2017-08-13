class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items


  def total
    x = 0
    self.items.each do |item|
      x += item.price
    end
    x
  end

  def add_item(item)
    # if self.line_items.include?(item_id: item)
    #   self.line_items.quantity += 1
    # else
    #   self.line_items.new(item_id: item)
    # end
    if LineItem.where(cart_id: self.id, item_id: item).present?
      # binding.pry
      a = LineItem.where(cart_id: self.id, item_id: item)
      a.first.quantity += 1
      # a.first.save
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
