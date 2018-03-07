class AdminController < ApplicationController
	before_action :authenticate_user!
	layout 'admin'

	def index
    authenticate_admin
	end

end
