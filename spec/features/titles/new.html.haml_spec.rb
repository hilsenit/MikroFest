require 'rails_helper'
require 'factories/publishers'

RSpec.feature "Title", type: :feature do
  describe "when creating a new title" do
  let(:publisher) { create(:publisher) }
  before { visit new_publisher_title_path(publisher.id) }

    it "should contain these fields" do
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
