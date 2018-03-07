require 'rails_helper'
require 'factories/publishers'
require 'factories/titles'

include ApplicationHelper
include ActionView::Helpers::NumberHelper

RSpec.feature "Title", type: :feature do
  let!(:publisher) { create(:publisher) }
  let!(:title) { create(:title, publisher_id: publisher.id) }

  before { visit one_title_path(publisher.id, title.id) }

  describe "#create" do

    it "should be in the cart if 'læg i kurv' is clicked" do
      find(".add-to-cart-btn").click
      visit cart_items_path()
      expect(page).to have_content(title.title)
      expect(page).to have_content(publisher.name)
    end

    it "should show quantity and the right price when added to cart" do
      number_of_titles = 5
      fill_in('cart_item[quantity]', with: number_of_titles)
      find(".add-to-cart-btn").click
      visit cart_items_path()
      expect(page).to have_content(pretty_amount_helper(title.price * number_of_titles))
      expect(page).to have_content(number_of_titles)
    end

  end

  describe "#destroy" do

    it "should dissapear from cart when deleted" do
      find(".add-to-cart-btn").click
      visit cart_items_path()
      find(".delete-cart-item-btn").click
      within(:css, "table") do # The notice message is shown with the title
        expect(page).not_to have_content(title.title)
        expect(page).not_to have_content(publisher.name)
      end
    end

  end
end
