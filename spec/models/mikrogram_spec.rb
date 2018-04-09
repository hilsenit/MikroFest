require 'rails_helper'
require 'factories/publishers'

RSpec.describe Mikrogram, type: :model do
  let(:pub) { create(:publisher) }

  describe "#create" do
    it "should return unvalid when trying to save without title" do
      mikro = Mikrogram.new(title: "", description: "Lorem adf", publisher_id: pub.id)
      expect(mikro.valid?).to eq(false)
    end

    it "should return unvalid when trying to save without description" do
      mikro = Mikrogram.new(title: "Hej", description: "", publisher_id: pub.id)
      expect(mikro.valid?).to eq(false)
    end

    it "should be valid when both" do
      mikro = Mikrogram.new(title: "Hej", description: "Jamen dog", publisher_id: pub.id)
      expect(mikro.valid?).to eq(true)
    end
  end
end
