class Cart < ApplicationRecord
  has_many :cart_items

  def add_product(cart_item)
    current_item = cart_items.find_by(title_id: cart_item[:cart_item][:title_id])
    if current_item
      current_item.quantity += cart_item[:cart_item][:quantity].to_i
      current_item.save
    else
      self.cart_items.create(title_id: cart_item[:cart_item][:title_id], quantity: cart_item[:cart_item][:quantity], cart_id: self.id)
    end
  end
end
