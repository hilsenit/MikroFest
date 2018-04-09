require 'rails_helper'
require 'factories/publishers'

RSpec.feature "Title", type: :feature do
  let!(:publisher) { create(:publisher) }

  before { login_as(:publisher) }

  describe "#create" do
    it "should first be vissible when opened in a modal" do
      find('.open-mikrogram').click
      expect(page).to have_content('[name="mikrogram[title]"]')
      expect(page).to have_content('[name="mikrogram[description]"]')
    end
  end


end
