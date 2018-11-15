class CategoriesController < ApplicationController
  def index
    @categories = Category.all()
  end

  def show
    @category = Category.find(params[:id])
    @products = Product.where(category_id: @category).page(params[:page]).per(9)
  end

end
