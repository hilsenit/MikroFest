class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :address, :password)
  end

end
