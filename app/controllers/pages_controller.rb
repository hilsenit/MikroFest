class PagesController < ApplicationController
	# before_action :authenticate_user!, except: [:countdown]

	def frontpage
    @users = User.where.not(admin: true)
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

  def read_more
  end

	def about
	end

	def publishers
		@publishers = Publisher.page params[:page]
	end

	def publisher
		@publisher = Publisher.friendly.find(params[:id])
		@titles = @publisher.titles
	end

	def titles
		@titles = Title.page params[:page]
	end

	def title
		@publisher = Publisher.friendly.find(params[:publisher_id])
		@title = Title.friendly.find(params[:id])
    @maybe_you_would_like = @publisher.maybe_you_would_like @title.id
	end

end
