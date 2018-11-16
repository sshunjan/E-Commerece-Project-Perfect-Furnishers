class ProductsController < ApplicationController
  def index
    @products = Product.order(:name).page(params[:page]).per(9)

    if(params[:filter] && params[:category])
      @status = StatusType.find(params[:filter])
      @products = @products.where(category_id: params[:category])
                          .where(status_type_id: params[:filter])

      add_breadcrumb "Sorting By: #{@status.name}"
    elsif (params[:filter])
      @status = StatusType.find(params[:filter])
      @products = @products.where(status_type_id: params[:filter])

      add_breadcrumb "Sorting By: #{@status.name}"
    end
  end

  def show
    @product = Product.find(params[:id])
    add_breadcrumb "#{@product.category.name}", category_path(@product.category.id)
    add_breadcrumb "#{@product.name}"
  end
end
