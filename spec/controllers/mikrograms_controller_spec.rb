require 'rails_helper'
require 'factories/publishers'


RSpec.describe MikrogramsController, type: :controller do
  let(:publisher) { create(:publisher) }
  describe "#create" do

    it "should redirect to all mikrograms if save" do
      login_as(publisher, scope: :publisher)
      post :create, params: {mikrogram: {publisher_id: publisher.id, title: "Exampla", description: "Hvad skal der dog ske" }}
      expect(page).to redirect_to(publishers_mikrogram_path())
    end

    it "should not be able to create without login in" do
      post :create, params: {mikrogram: {publisher_id: publisher.id, title: "Exampla", description: "Hvad skal der dog ske" }}
      expect(page).to redirect_to(new_publisher_session_path())
    end

  end
end
