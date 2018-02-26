class PagesController < ApplicationController
	# before_action :authenticate_user!, except: [:countdown]

	def frontpage
	end

  def countdown
		unless user_signed_in?
			render layout: 'countdown'
		else
			redirect_to forside_path()
		end
  end

  def pages

  end

	def about

	end

	def publishers
		@publishers = Publisher.all
	end

	def publisher
		@publisher = Publisher.friendly.find(params[:id])
		@titles = @publisher.titles
	end

	def titles
		@titles = Title.all
	end

	def title
		@publisher = Publisher.friendly.find(params[:publisher_id])
		@title = Title.friendly.find(params[:id])
	end

end
