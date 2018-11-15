class ProductsController < ApplicationController

  def index
    @products = Product.order(:name).page(params[:page]).per(9)


    if(params[:filter] && params[:category])
      @products = @products.where(category_id: params[:category])
                          .where(status_type_id: params[:filter])
    elsif (params[:filter])
       @products = @products.where(status_type_id: params[:filter])
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
