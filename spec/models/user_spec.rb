require 'rails_helper'
require 'factories/users'

RSpec.describe User, type: :model do

  describe "#email" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to allow_value("hej@gmail.com").for(:email) }
    it { is_expected.not_to allow_value("hej").for(:email) }
  end

  describe "#address" do
    it { is_expected.to validate_presence_of(:address) }
  end

  describe "#full_name" do
    it { is_expected.not_to validate_presence_of(:full_name) }
  end

  describe "#favorite_word" do
    it { is_expected.to validate_presence_of(:favorite_word) }
  end
end
