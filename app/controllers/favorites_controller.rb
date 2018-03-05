class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    user_id = current_user.id
    title = Title.find(params[:title_id])
    favorite = Favorite.new(title_id: title.id, user_id: user_id)
    if favorite.valid? # Haven't been saved before
      favorite.save!
      @message = "#{title.title} er blevet gemt under dine favoritter"
      render template: 'shared/js/notice.js'
    else
      @message = "#{title.title} kunne ikke gemmes, da du allerede har gemt den under dine favoritter"
      render template: 'shared/js/error.js'
    end
  end
end
