require 'rails_helper'
require 'factories/publishers'

RSpec.describe TitlesController, type: :controller do
  let(:publisher) { create(:publisher) }
  describe "#new" do
    it "should build a review" do
      # I don't know how to do this
    end
  end
end
