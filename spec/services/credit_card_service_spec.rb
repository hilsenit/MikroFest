require 'rails_helper'
require 'stripe_mock'
require 'factories/users'
require 'factories/creditcard'


RSpec.describe CreditCardService do
  let(:user)    	{ create :user }
  let(:card_params) { attributes_for :credit_card }

  before do
    StripeMock.start
    user.update(customer_id: Stripe::Customer.create(email: user.email).id)
  end

  after { StripeMock.stop }

  context '#create_credit_card' do
    subject { described_class.new(user.id, card_params).create_credit_card }

    it 'creates credit card' do
      subject

      expect(Stripe::Customer.retrieve(user.customer_id).sources.data.last.id).to eq subject
    end
  end
end
