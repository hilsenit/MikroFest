module StripeTools
	# link: https://rails.devcamp.com/ruby-gem-walkthroughs/payment/how-to-integrate-stripe-payments-in-a-rails-application-charges
  # I added self to each method because I want to be able to call them from the controller with the syntax StripeTool.create_charge instead of having to instantiate the module separately.

	def self.create_customer(email: email, stripe_token: stripe_token)
		Stripe::Customer.create(
			:email => email,
			:source  => stripe_token
		)
	end

	def self.create_charge(customer_id: customer_id, amount: amount, description: description, currency: currency)
		Stripe::Charge.create(
				:customer    => customer_id,
				:amount      => amount,
				:description => description,
				:currency    => "dkk"
		)
  end

end
