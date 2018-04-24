class ChargesController < ApplicationController
  before_action :authenticate_user!
  # before_action :find_title // Removed while i'm creating the new checkout
	layout 'application'

  def create #Can't use it when not logged in yet
    is_cart_created? # generates @cart

    begin
      stripe_card_id = params[:credit_card].present? ?
        CreditCardService.new(current_user.id, card_params).create_credit_card :
        charge_params[:card_id]

      Stripe::Charge.create(
        customer: current_user.customer_id,
        source:   stripe_card_id,
        amount:   @cart.get_full_price * 100, # Stripe
        currency: 'dkk'
      )

      if params[:credit_card].present? && stripe_card_id
        current_user.credit_cards.create_with(card_params).find_or_create_by(stripe_id: stripe_card_id)
      end

      title_count = @cart.cart_items.sum(&:quantity)
      flash[:notice] = "Tak for dit køb. Vi sender en mail, så snart #{title_count > 1 ? "titlerne" : "titlen"} bliver sendt."
      @cart.destroy #Remove cart and cart items
      redirect_to user_path(current_user, profile: "purchases")

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to checkout_path()
    end
  end

  private

  def is_cart_created?
    @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, notice: "Du bliver nødt til at lægge noget i din kurv for at kunne gå til checkout"
  end

  def card_params
    params.require(:credit_card).permit(:number, :exp_month, :exp_year, :cvc)
  end

  def charge_params
    params.require(:charge).permit(:card_id)
  end

  # def find_title
  #   @title = Title.find(params[:title_id])
  # rescue ActiveRecord::RecordNotFound => e
  #   flash[:alert] = 'Bogen findes ikke'
  #   redirect_to root_path
  # end
end
