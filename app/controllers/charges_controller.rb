class ChargesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_title

	layout 'application'

  def create
    begin
      stripe_card_id =
        if params[:credit_card].present?
          CreditCardService.new(current_user.id, card_params).create_credit_card
        else
          charge_params[:card_id]
        end

      Stripe::Charge.create(
        customer: current_user.customer_id,
        source:   stripe_card_id,
        amount:   @title.price_in_dkk,
        currency: 'dkk'
      )

      if params[:credit_card].present? && stripe_card_id
        current_user.credit_cards.create_with(card_params).find_or_create_by(stripe_id: stripe_card_id)
      end

      flash[:notice] = "Din betaling er gået igennem. Vi vil inden længe sende dig en bekræftelsesemail, hvor du kan se din ordre. Vi vil gerne sige tak for din støtte til de små forlag!"
      redirect_to user_path(current_user, profile: "purchases")

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to one_title_path(@title.publisher.id, @title.id)
    end
  end

  private

  def card_params
    params.require(:credit_card).permit(:number, :month, :year, :cvc)
  end

  def charge_params
    params.require(:charge).permit(:card_id)
  end

  def find_title
    @title = Title.find(params[:title_id])
  rescue ActiveRecord::RecordNotFound => e
    flash[:alert] = 'Bogen findes ikke'
    redirect_to root_path
  end
end
