require 'rails_helper'
require 'factories/users'
require 'factories/publishers'
require 'factories/titles'

RSpec.describe Favorite, type: :model do
  let(:user) {create(:user)}
  let(:publisher) {create(:publisher)}
  let(:title) {create(:title, publisher_id: publisher.id)}

  describe "a user can't have the same book as favorite twice" do
    it "should give an error when trying saving same title favorite twice" do
      Favorite.create(user_id: user.id, title_id: title.id)
      fav = Favorite.new(user_id: user.id, title_id: title.id)
      expect(fav).not_to be_valid
    end
  end

end
