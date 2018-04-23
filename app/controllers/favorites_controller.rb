class FavoritesController < ApplicationController
  include Messages
  before_action :authenticate_user!, except: [:create]

  def create
    title = Title.find(params[:title_id])
    if user_signed_in?
      user_id = current_user.id
      favorite = Favorite.new(title_id: title.id, user_id: user_id)
      if favorite.valid? # Haven't been saved before
        favorite.save!
        @message = favorite_succesfull_saved_message title.title
        render template: 'shared/js/notice.js'
      else
        @message = favorite_already_saved_message title.title
        render template: 'shared/js/error.js'
      end
    else # user_signed_in?
      @message = missing_login_or_sign_up_message "For at gemme #{title.title}"
      render template: 'shared/js/notice.js'
    end

  end

  def destroy
    unless Favorite.exists?(params[:id])
      flash[:alert] = favorite_missing_message
      redirect_to user_path(current_user.id, profile: 'favorites')
    else
      @favorite = Favorite.find(params[:id])
      if @favorite.destroy
        flash[:notice] = succesfully_deleted_message @favorite.title.title
        redirect_to user_path(current_user.id, profile: 'favorites')
      else
        flash[:alert] = something_whent_wrong_message @favorite.title.title
        redirect_to user_path(current_user.id, profile: 'favorites')
      end
    end
  end

end
