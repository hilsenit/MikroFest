require 'rails_helper'

require 'factories/users'
require 'factories/publishers'
require 'factories/titles'

RSpec.feature "User", type: :feature do
  let!(:user) { create(:user) }
  let!(:publisher) { create(:publisher) }
  let!(:title) { create(:title, publisher_id: publisher.id) }

  describe "when visiting a title" do

  before { visit one_title_path(publisher.id, title.id) }

    it "should have a link to save a title to favorites" do
      expect(page).to have_selector(:css, "[href$='add_favorite/#{title.id}']")
      # expect(page).to have_selector(:css, "[href='#{review.url}']")
    end

    it "should show a notice when saving favorite" do
      login_as(user, scope: :user)
      find(".save-favorite").click
      expect(page).to have_content("#{title.title} er blevet gemt under dine favoritter")
    end

  end
end
