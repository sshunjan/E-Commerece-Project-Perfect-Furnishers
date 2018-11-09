class ProductsController < ApplicationController

  def index
    @products = Product.order(:name).page(params[:page]).per(9)


    if(params[:filter])
      @products = @products.where(status_type_id: params[:filter])
    else

    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
