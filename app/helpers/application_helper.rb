module ApplicationHelper

	def pretty_amount_helper(amount)
		number_to_currency(amount, unit: "DKK ", seperator: ",", delimiter: ".", format: "%n %u")
	end

  def cart_items_count_helper
    if @cart.cart_items.any?
      cart_items_count = @cart.cart_items.sum(:quantity)
      "|#{cart_items_count}| Kurv"
    else
      "Kurv"
    end
  end

end
