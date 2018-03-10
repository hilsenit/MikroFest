require 'rails_helper'
require 'factories/publishers'
require 'factories/titles'


RSpec.describe Publisher, type: :model do
  let!(:publisher) { create(:publisher) }
  let!(:title) { create(:title, publisher_id: publisher.id) }
  let!(:title_in_maybe) { create(:title, publisher_id: publisher.id) }

  describe "#maybe_you_would_like" do
    it "should not show the title given to it" do
      list_of_maybes = publisher.maybe_you_would_like title.id
      expect(list_of_maybes).not_to include(title)
    end
    it "should show the title of another title with same publisher" do
      list_of_maybes = publisher.maybe_you_would_like title.id
      expect(list_of_maybes).to include(title_in_maybe)
    end
  end
end
