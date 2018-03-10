require 'rails_helper'
require 'factories/users'
require 'factories/publishers'
require 'factories/titles'

RSpec.describe CartItemsController, type: :controller do
  let(:user) { create(:user) }
  let(:publisher) { create(:publisher) }
  let(:title) { create(:title, publisher_id: publisher.id) }

  # Kan ikke lade sig gøre, da det er en session, som sætter forbindelsen mellem user og cart (se ApplicationController)
  # describe "#checkout" do
  #
  #   it "should redirect if no cart_items are added" do
  #     get :checkout
  #     expect(response).to eq(302)
  #   end

  #   it "should show if anything is in the cart" do
  #     cart = Cart.create(user_id: user.id)
  #     CartItem.create(cart_id: cart.id, title_id: title.id)
  #     get :checkout
  #     expect(response).to eq(200)
  #   end
  # end

end
