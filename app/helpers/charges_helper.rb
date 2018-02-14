module ChargesHelper

	def pretty_amount(amount_in_oerer)
		number_to_currency(amount_in_oerer / 100, unit: "DKK", seperator: ",", delimiter: ".")
	end

end
