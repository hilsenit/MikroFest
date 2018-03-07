class AddTitleIdToCartItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :cart_items, :title, foreign_key: true
  end
end
