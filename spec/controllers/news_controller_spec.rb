require 'rails_helper'

RSpec.describe NewsController, type: :controller do
  describe "#new" do
    it "should render new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

end
