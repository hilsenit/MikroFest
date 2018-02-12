class PagesController < ApplicationController
	before_action :authenticate_admin!, except: [:countdown]
  def countdown
		unless admin_signed_in?
			render layout: 'countdown'
		else
			redirect_to forside_path()
		end
  end

	def frontpage
	end
end
