require 'rails_helper'
require 'factories/admin'

RSpec.describe AdminController, type: :controller do
  describe "#index" do
    let (:admin) { create(:admin) }

    context "when user is logged in" do
      it "should redirect" do
        get :index
        expect(response.status).to eq(302)
      end
    end

    context "when user is not logged in" do
      it "should not redirect" do
        sign_in admin
        get :index
        expect(response.status).to eq(200)
      end
    end
  end

end
