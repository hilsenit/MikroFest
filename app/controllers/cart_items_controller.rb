class CartItemsController < ApplicationController

  def index
    @cart = Cart.find(session[:cart_id])
    @cart_items = @cart.cart_items
  end

  def checkout

  end

  def create
    @cart = Cart.find(session[:cart_id])
    @cart.add_product(params)
    @title = Title.find(params[:cart_item][:title_id])
    if @cart.save
      flash[:notice] = "Du har sat #{@title.title} i #{view_context.link_to('din kommende reol', cart_items_path())}."
      redirect_to one_title_path(@title.publisher_id, @title.id)
    else
      flash[:alert] = "Der opstod et problem, da du prøvede at lægge #{@title.title} i kurven. Prøv igen."
      redirect_to one_title_path(@title.publisher_id, @title.id)
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    title = @cart_item.title
    @cart_item.destroy
    flash[:notice] = "Du har slettet #{view_context.link_to(title.title, one_title_path(title.publisher_id, title.id))} fra din kurv"
    redirect_to cart_items_path()
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:cart_id, :title_id, :quantity)
  end


end
