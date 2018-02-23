require 'rails_helper'
require 'factories/users.rb'

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    it "create new user" do
      post :create, params: {user: attributes_for(:user)}
      expect(User.count).to eq(1)
    end

    context "when invalid" do
      it "should not create new user" do
        invalid_user_params = attributes_for(:user, full_name: "")
        post :create, params: {user: invalid_user_params}
        expect(User.count).to eq(0)
      end
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
