class TitlesController < ApplicationController
	layout 'admin'

	def index
		@publisher = Publisher.friendly.find(params[:publisher_id])
		@titles = @publisher.titles
	end

	def new
		@publisher = Publisher.friendly.find(params[:publisher_id])
		@title = Title.new
	end

	def show
		@publisher = Publisher.friendly.find(params[:publisher_id])
		@title = Title.find(params[:id])
	end

	def create
		@publisher = Publisher.friendly.find(params[:publisher_id])
		@title = Title.new(title_params)
		@title.publisher_id = @publisher.id
		if @title.save
			flash[:notice] = "#{@title.title} er blevet gemt"
			redirect_to publisher_titles_path(@title.publisher.id)
		else
			# flash.now[:error] = "Der skete en fejl. #{@title.name} blev ikke gemt"
			render :new
		end
	end

	def edit
		@publisher = Publisher.friendly.find(params[:publisher_id])
		@title = Title.find(params[:id])
	end

	def update
		@publisher = Publisher.friendly.find(params[:publisher_id])
		@title = Title.friendly.find(params[:id])
		@title.publisher_id = @publisher.id
		if @title.update(title_params)
			flash[:notice] = "#{@title.title} er blevet opdateret"
			redirect_to publisher_titles_path(@title.publisher.id)
		else
			flash.now[:error] = "Der skete en fejl. #{@title.title} blev ikke opdateret"
			render :new
		end
	end

	def destroy
		@title = Title.friendly.find(params[:id])
		if @title.destroy
			flash[:notice] = "#{@title.title} er blevet slettet"
			redirect_to pulisher_titles_path(@title.publisher.id)
		else
			flash.now[:error] = "#{@title.title} blev ikke slettet. Prøv igen"
			render :index
		end
	end

	private

	def title_params
		params.require(:title).permit(:title, :description, :image, :publisher_id)
	end

end
