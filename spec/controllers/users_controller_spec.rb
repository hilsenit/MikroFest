require 'rails_helper'
require 'factories/users.rb'

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    it "should not be able to create user without login" do
      post :create, params: {user: attributes_for(:user)}
      expect(User.count).to eq(0)
    end
  end

  describe "GET #new" do
    let(:user) { create(:user) }
    it "should render new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end
end
