class Cart < ApplicationRecord
  has_many :cart_items
  attr_accessor :full_price

  def add_product(cart_item)
    current_item = cart_items.find_by(title_id: cart_item[:cart_item][:title_id])
    if current_item
      current_item.quantity += cart_item[:cart_item][:quantity].to_i
      current_item.save
    else
      self.cart_items.create(title_id: cart_item[:cart_item][:title_id], quantity: cart_item[:cart_item][:quantity], cart_id: self.id)
    end
  end

  def remove_product(cart_item)
    current_item = cart_items.find_by(title_id: cart_item[:cart_item][:title_id])
    current_item.quantity -= 1
    current_item.save
  end

  def get_full_price
    raise "Der er ingen titler i kurven" if self.cart_items.empty?
    self.full_price = self.cart_items.sum {|ci| ci.quantity * ci.title.price }
  end

end
