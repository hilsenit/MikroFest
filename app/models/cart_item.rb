class CartItem < ApplicationRecord
  attr_accessor :titles_price

  belongs_to :cart
  belongs_to :title

  def get_titles_price
    self.titles_price = quantity * title.price
  end
end
