class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
  has_many :orders

  def total
    self.line_items.inject(0) { |sum, line_item| sum + (Item.find(line_item.item_id).price)*(line_item.quantity)}
  end


  def add_item(item)
    if self.line_items.where(item_id: item).present?
      a = self.line_items.where(item_id: item)
      a.first.quantity += 1
      a.first.save
      a.first
      # a.first.increment!(:quantity)
    else
      self.line_items.new(item_id: item)
    end
  end
end
