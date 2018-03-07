class CartItemsController < ApplicationController

  def index
    @cart = Cart.find(session[:cart_id])
    @cart_items = @cart.cart_items
  end

  def create
    @cart = Cart.find(session[:cart_id])
    @cart.add_product(params)
    if @cart.save
      redirect_to cart_items_path
    else
      flash[:alert] = "Der opstod et problem, da du prøvede at lægge titlen i kurven. Prøv igen."
      redirect_to one_title_path(@title)
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:cart_id, :title_id, :quantity)
  end


end
