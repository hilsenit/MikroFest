require 'rails_helper'
require 'factories/publishers'
require 'factories/titles'
require 'factories/reviews'

RSpec.feature "Title", type: :feature do
  describe "when showing a title" do
  let!(:publisher) { create(:publisher) }
  let!(:title) { create(:title, publisher_id: publisher.id) }
  let!(:review) { create(:review, title_id: title.id) }

  before { visit one_title_path(publisher.id, title.id) }

    it "should show reviews if there are any" do
      expect(page).to have_content(review.written_by)
      expect(page).to have_content(review.text)
      # expect(page).to have_selector(:css, "[href='#{review.url}']")
    end

  end
end
