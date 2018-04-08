class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :show, :another_user]
  layout 'admin', only: :index

  def show
    @user = User.friendly.find(params[:id])
    if @user == current_user && user_signed_in?
      # should be called with ajax - somehow! To slow as it is now!
      @orders = Stripe::Charge.list(customer: @user.customer_id)
    else
      redirect_to another_user_path(@user.id) # The current user should see a normal page with the users info
    end
  end

  def another_user
    @user = User.friendly.find(params[:user_id])
    @favorites = @user.favorites
  end

  def new
    @user = User.new
  end

  def index
    authenticate_admin
    @users = User.where.not(admin: true)
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
    params.require(:user).permit(:full_name, :email, :address, :password, :favorite_word)
  end

end
