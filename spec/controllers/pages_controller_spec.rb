require 'rails_helper'
require 'factories/users'
require 'factories/publisher'

RSpec.describe PagesController, type: :controller do
  describe "#countdown" do
    let(:user) { create(:user) }

    context "when no one is logged in" do
      it "should not redirect" do
        get :countdown
        expect(response.status).to eq(200)
      end
     end

    context "when admin is logged in" do
      it "should redirect" do
        sign_in user
        get :countdown
        expect(response.status).to eq(302)
      end
     end
  end

  describe "#publishers" do
     let(:publisher) { create(:publisher) }
     context "when visiting publishers path" do
      it "should render publishers (plural)" do

      end
     end
  end
end
