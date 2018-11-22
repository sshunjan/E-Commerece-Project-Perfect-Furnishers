class CartController < ApplicationController
  def index
    add_breadcrumb "Cart"
  end

  def show
  end

  def addToCart
    session[:cart] ||= []
    #session[:cart] = []
    session[:cart] << {:id =>params[:id], :qty =>params[:quantity], :price =>params[:price]}
    redirect_to cart_index_path
  end

  def removeFromCart
    if(params[:submit] == "Remove")
      session[:cart].delete_at(params[:number].to_i)
    else
      session[:cart][params[:number].to_i]["qty"] = params[:qty].to_i
    end

    redirect_to cart_index_path
  end

  def checkout
    add_breadcrumb "Cart", cart_index_path
    add_breadcrumb "Checkout", checkout_path
  end

end
