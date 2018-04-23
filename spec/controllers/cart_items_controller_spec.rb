require 'rails_helper'
require 'factories/users'
require 'factories/publishers'
require 'factories/titles'

RSpec.describe CartItemsController, type: :controller do
  let(:user) { create(:user) }
  let(:publisher) { create(:publisher) }
  let(:title) { create(:title, publisher_id: publisher.id) }

  # Kan ikke lade sig gøre, da det er en session, som sætter forbindelsen mellem user og cart (se ApplicationController)
  describe "#index" do
    it "is expected to return a full_price equal one products price" do
    end
  end

end
