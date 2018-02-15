class ChargesController < ApplicationController
	before_action :amount_to_be_charged
	before_action :set_description

	layout 'application'

	def new
	end

	def create

	customer = StripeTools.create_customer(
																				 email: params[:stripeEmail], stripe_token: params[:stripeToken])
	charge = StripeTools.create_charge(
																		 customer_id: customer.id, amount: @amount, description: "")

	redirect_to thanks_path

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_charge_path
	end

	def thanks
	end

	private

	def amount_to_be_charged
		@amount = 500
	end

	def set_description
		@description = "Tiny little book - that's nice!"
	end

end
