require 'rails_helper'

require 'factories/users'
require 'factories/publishers'
require 'factories/titles'

RSpec.feature "User", type: :feature do
  let!(:user) { create(:user) }
  let!(:publisher) { create(:publisher) }
  let!(:title) { create(:title, publisher_id: publisher.id) }

  describe "when visiting profile" do

    it "should show favorites after saving them" do
    end

  end
end
