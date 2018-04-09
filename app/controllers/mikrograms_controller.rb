class MikrogramsController < ApplicationController
  before_action :authenticate_publisher!, except: [:index]

  def create
    @mikrogram = Mikrogram.new(mikrograms_params)
    @mikrogram.publisher = current_publisher
    if @mikrogram.save
      flash[:notice] = "Dit Mikrogram '#{@mikrogram.title}' er blevet udgivet"
      redirect_to publishers_mikrogram_path
    else
      @publisher = @mikrogram.publisher
      @open_modal = "true"
      render 'publishers/dashboard', open: "true"
    end
  end

  def index
    @mikrograms = Mikrogram.all
  end

  private

  def mikrograms_params
    params.require(:mikrogram).permit(:title, :description, :publisher_id)
  end


end
