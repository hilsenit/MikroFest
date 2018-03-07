require 'rails_helper'

RSpec.describe Title, type: :model do

  describe "#price" do
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to allow_value(100).for(:price) }
  end

  describe "#title" do
    it { is_expected.to validate_presence_of(:title) }
  end

end
