require 'rails_helper'
require 'factories/users'
require 'factories/publishers'
require 'factories/titles'
require 'factories/favorites'


RSpec.describe FavoritesController, type: :controller do
  let(:publisher) { create(:publisher) }
  let(:title) { create(:title, publisher_id: publisher.id) }
  let(:user) { create(:user) }

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

  describe "#destroy" do
    let!(:favorite) { create(:favorite, user_id: user.id, title_id: title.id) }

    it "should remove favorite when user is logged in" do
      sign_in user
      delete :destroy, params: {id: favorite.id}
      expect(Favorite.count).to eq(0)
    end

    it "should not remove favorite when iser isn't logged in" do
      delete :destroy, params: {id: favorite.id}
      expect(Favorite.count).to eq(1)
    end

  end

end
