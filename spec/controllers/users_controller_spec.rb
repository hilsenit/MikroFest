require 'rails_helper'
require 'factories/users.rb'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create(:user) }
  let!(:admin_user) { create(:user, admin: true) }

  describe "POST #create" do
    it "should be able to create user with the right attributes" do
      post :create, params: {user: attributes_for(:user)}
      expect(User.count).to eq(3) # With the two already created
    end
  end

  describe "GET #new" do
    it "should render new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #index" do
    it "should not be possible for a normal user to visit all users path(admin)" do
      get :index
      expect(response.status).to eq(302)
    end

    it "should be possible for the user with a admin boolean to visit the site" do
      sign_in admin_user
      get :index
      expect(response.status).to eq(200)
    end
  end
end
