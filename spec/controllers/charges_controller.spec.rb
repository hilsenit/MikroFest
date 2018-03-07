require 'stripe_mock'
require 'devise'
require 'factories/users'
require 'factories/titles'

RSpec.describe ChargesController do
  let(:title) { create :title }
  let(:user)	{ create :user }
  let(:event)   { StripeMock.mock_webhook_event('charge.succeeded') }

  before do
    StripeMock.start
    user.update(customer_id: Stripe::Customer.create(email: user.email).id)
    sign_in user
  end

  after { StripeMock.stop }

  describe '#create' do
    context 'with new card' do
      let(:card_params) { attributes_for :credit_card }

      subject { post :create, credit_card: card_params, product_id: product.id }

      it 'create card and charge' do
        expect{ subject }.to change{ CreditCard.count }.by 1
        expect(response.status).to eq 200
      end
    end

    context 'with existing card' do
      let(:card_params)	{ attributes_for :credit_card, user_id: user.id }
      let(:charge_params)  { user.credit_cards.create(attributes_for :credit_card) }
      let(:stripe_card_id) { CreditCardService.new(user.id, card_params).create_credit_card }
      let!(:credit_card)   { CreditCard.create_with(card_params).find_or_create_by(stripe_id: stripe_card_id) }

      subject { post :create, charge: { card_id: credit_card.stripe_id }, product_id: product.id }

      it 'create charge with existing card' do
        expect{ subject }.to change{ CreditCard.count }.by 0
        expect(response.status).to eq 200
        expect(response).to render_template('create')
      end
    end
  end
end
