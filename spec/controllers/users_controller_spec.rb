require 'rails_helper'
require 'factories/users.rb'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create(:user) }
  let!(:another_user) { create(:user) }
  let!(:admin_user) { create(:user, admin: true) }


end
