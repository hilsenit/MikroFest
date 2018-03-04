require 'rails_helper'
require 'factories/publishers'

RSpec.feature "Title", type: :feature do
  describe "when editing a user" do
  let(:publisher) { create(:publisher) }
  let(:title) { create(:title, publisher_id: publisher.id) }
  before { visit edit_publisher_title_path(publisher.id, title.id) }

    it "should contain reviews fields" do
      expect(page).to have_css("[name='title[title]']")
      expect(page).to have_css("[name='title[description]']")
      expect(page).to have_css("[name='title[image]']")
      expect(page).to have_css("[name^='title[reviews_attributes]']")
      expect(page).to have_css("[name$='written_by]']") # Cocoon generates an id, this is the best i can do
      expect(page).to have_css("[name$='text]']") #
      expect(page).to have_css("[name$='url]']") #
    end
  end
end
