module ApplicationHelper

	def pretty_amount_helper(amount)
		number_to_currency(amount, unit: "DKK ", seperator: ",", delimiter: ".", format: "%n %u")
	end

  def open_if_param_helper open_params, class_to_return
    class_to_return if open_params[:open] = "true"
  end

  def cart_items_count_helper
    if @cart.cart_items.any?
      cart_items_count = @cart.cart_items.sum(:quantity)
      "|#{cart_items_count}| Reol"
    else
      "Reol"
    end
  end

end
