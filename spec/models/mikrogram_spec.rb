require 'rails_helper'

RSpec.describe Mikrogram, type: :model do
  describe "#create" do
    it "should return unvalid when trying to save without title" do
      mikro = Mikrogram.new(title: "", description: "Lorem adf")
      expect(mikro.valid?).to eq(false)
    end
  end
end
