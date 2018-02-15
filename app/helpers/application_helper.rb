module ApplicationHelper

	def pretty_amount_helper(amount_in_oerer)
		number_to_currency(amount_in_oerer / 100, unit: "DKK ", seperator: ",", delimiter: ".", format: "%n %u")
	end

end
