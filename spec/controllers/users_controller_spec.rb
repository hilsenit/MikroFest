require 'rails_helper'
require 'factories/users.rb'

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    it "new user" do
      post :create, params: {user: attributes_for(:user)}
      expect(User.count).to eq(1)
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
