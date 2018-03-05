require 'rails_helper'

RSpec.feature "User", type: :feature do
  describe "when creating a new user" do
    before { visit new_user_path() }

    it "should have fields for each attribute and a submit button" do
      expect(page).to have_css("[name='user[full_name]']")
      expect(page).to have_css("[name='user[email]']")
      expect(page).to have_css("[name='user[address]']")
      expect(page).to have_css("[name='user[password]']")
      expect(page).to have_css("[type='submit']")
    end

    it "should show error if one field isn't filled" do
      #missing

    end
  end

end
