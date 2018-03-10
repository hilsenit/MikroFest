require 'rails_helper'
require 'factories/publishers'
require 'factories/titles'

include ApplicationHelper
include ActionView::Helpers::NumberHelper

RSpec.feature "Checkout", type: :feature do
  let!(:publisher) { create(:publisher) }
  let!(:title) { create(:title, publisher_id: publisher.id) }

  describe "#checkout" do

    it "should show the items form the cart on checkout" do
      visit one_title_path(publisher.id, title.id)
      find(".add-to-cart-btn").click
      visit cart_items_path()
      find(".go-to-checkout-btn").click
      expect(page).to have_content(title.title)
      expect(page).to have_content(pretty_amount_helper(title.price))
    end

  end

end
