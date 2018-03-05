require 'rails_helper'
require 'factories/users'
require 'factories/publishers'
require 'factories/titles'

RSpec.describe FavoritesController, type: :controller do
  let(:user) { create(:user) }
  let(:publisher) { create(:publisher) }
  let(:title) { create(:title, publisher_id: publisher.id) }

  describe "#create" do
    it "should create a Favorite if user is logged in" do
      sign_in user
      post :create, params: {title_id: title.id }
      expect(Favorite.count).to eq(1)
    end

    it "should not create a favorite when user isn't logged in" do
      post :create, params: {title_id: title.id }
      expect(Favorite.count).to eq(0)
    end
  end

end
