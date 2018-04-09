class MikrogramsController < ApplicationController
  before_action :authenticate_publisher!

  def create
    @mikrogram = Mikrogram.new(mikrograms_params)
    @mikrogram.publisher = current_publisher
    if @mikrogram.save
      redirect_to publisher_mikrograms_path
    else
      byebug
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