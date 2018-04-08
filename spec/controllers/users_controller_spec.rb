require 'rails_helper'
require 'factories/users.rb'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create(:user) }
  let!(:another_user) { create(:user) }
  let!(:admin_user) { create(:user, admin: true) }

  #  SIMPELTHEN FOR LANGSOM --- 27 SEK!
  #
  # describe "POST #create" do
  #   it "should be able to create user with the right attributes" do
  #     post :create, params: {user: attributes_for(:user)}
  #     expect(User.count).to eq(4) # With the three already created
  #   end
  # end

  # describe "GET #show" do

  #   it "should render user show template when matching logged in user" do
  #     sign_in user
  #     get :show, params: { id: user.id }
  #     expect(response.status).to eq(200)
  #   end

  #   it "should redirect when the user visiting is not the same as logged in" do
  #     sign_in another_user
  #     get :show, params: { id: user.id }
  #     expect(response.status).to eq(302)
  #   end

  #   it "should redirect to another_user_path with users info" do
  #     sign_in another_user
  #     get :show, params: { id: user.id }
  #     expect(response).to redirect_to(another_user_path(user_id: user.id))
  #   end

  #   it "should redirect to another user and show users info if not logged in" do
  #     get :show, params: { id: user.id }
  #     expect(response).to redirect_to(another_user_path(user_id: user.id))
  #   end

  # end

  # describe "GET #new" do
  #   it "should render new template" do
  #     get :new
  #     expect(response).to render_template(:new)
  #   end
  # end

  # describe "GET #index" do
  #   it "should not be possible for a normal user to visit all users path(admin)" do
  #     get :index
  #     expect(response.status).to eq(302)
  #   end

  #   it "should be possible for the user with a admin boolean to visit the site" do
  #     sign_in admin_user
  #     get :index
  #     expect(response.status).to eq(200)
  #   end
  # end

end
