require 'rails_helper'

RSpec.describe MikrogramsController, type: :controller do
  describe "#create" do
    it "should redirect to all mikrograms if save" do
      post :create, params: {mikrogram: { title: "Exampla", description: "Hvad skal der dog ske" }}
      expect(page).to redirect_to(mikrograms_path)
    end
  end
end
