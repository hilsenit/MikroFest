class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
      # request.env['omniauth.origin'] || stored_location_for(resource) || root_path
      user_path(resource.id)
  end

  def configure_permitted_parameters
    attributes = [:favorite_word, :full_name, :address, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  def set_cart
    @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
  end

  def authenticate_admin # is coverede for normal user by authenticate_user!
    unless current_user.admin?
      flash[:alert] = "Du har ikke administrator rettigheder. Derfor kan du ikke tilgå den side, som du lige prøvede."
      redirect_to root_path()
    end
  end

end
