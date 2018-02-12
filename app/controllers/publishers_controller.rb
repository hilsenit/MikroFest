class PublishersController < ApplicationController
	layout 'admin'

	def index
		@publishers = Publisher.all
	end

	def new
		@publisher = Publisher.new
	end

	def show
		@publisher = Publisher.friendly.find(params[:id])
	end

	def create
		@publisher = Publisher.new(publisher_params)
		if @publisher.save
			flash[:notice] = "#{@publisher.name} er blevet gemt"
			redirect_to publishers_path()
		else
			# flash.now[:error] = "Der skete en fejl. #{@publisher.name} blev ikke gemt"
			render :new
		end
	end


	def edit
		@publisher = Publisher.friendly.find(params[:id])
	end

	def update
		@publisher = Publisher.friendly.find(params[:id])
		if @publisher.update(publisher_params)
			flash[:notice] = "#{@publisher.name} er blevet opdateret"
			redirect_to publishers_path()
		else
			flash.now[:error] = "Der skete en fejl. #{@publisher.name} blev ikke opdateret"
			render :new
		end
	end

	def destroy
		@publisher = Publisher.friendly.find(params[:id])
		if @publisher.destroy
			flash[:notice] = "#{@publisher.name} er blevet slettet"
			redirect_to publishers_path()
		else
			flash.now[:error] = "#{@publisher.name} blev ikke slettet. Prøv igen"
			render :index
		end
	end

	private

	def publisher_params
		params.require(:publisher).permit(:name, :description, :image)
	end

end
