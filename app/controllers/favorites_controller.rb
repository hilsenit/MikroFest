class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    user_id = current_user.id
    title = Title.find(params[:title_id])
    favorite = Favorite.new(title_id: title.id, user_id: user_id)
    if favorite.valid? # Haven't been saved before
      favorite.save!
      @message =
        "#{title.title} er blevet gemt under dine #{view_context.link_to('favoritter', user_url(current_user.id, profile: 'favorites'))}"
      render template: 'shared/js/notice.js'
    else
      @message = "#{title.title} kunne ikke gemmes, da du allerede har gemt den under dine favoritter"
      render template: 'shared/js/error.js'
    end
  end

  def destroy

    unless Favorite.exists?(params[:id])
      flash[:alert] = "Favoritten findes ikke mere. Du har sandsynligvis slettet den allerede."
      redirect_to user_path(current_user.id, profile: 'favorites')
    else
      @favorite = Favorite.find(params[:id])
      if @favorite.destroy
        flash[:notice] = "#{@favorite.title.title} er blevet slettet fra dine favoritter"
        redirect_to user_path(current_user.id, profile: 'favorites')
      else
        flash[:alert] = "Noget gik galt. Det var ikke muligt at slette #{@favorite.title.title} fra dine favoritter. Kontakt support, hvis problemet fortsætter"
        redirect_to user_path(current_user.id, profile: 'favorites')
      end
    end


  end
end
