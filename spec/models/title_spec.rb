require 'rails_helper'
require 'factories/users'

RSpec.describe User, type: :model do
  describe "when creating a user" do
    let(:user) { build(:user) }
    it "should be unvalid when email is missing/empty" do
      user.email = ""
      user.skip_confirmation!
      expect(user).not_to be_valid
    end
    it "should be unvalid when email is unvalid" do
      user.email = "jklsadjhlhjk@@hej.dcom"
      user.skip_confirmation!
      expect(user).not_to be_valid
    end

    it "should be valid when full_name is empty" do
      user.full_name = ""
      user.skip_confirmation!
      expect(user).to be_valid
    end
  end
end
