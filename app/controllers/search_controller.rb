class SearchController < ApplicationController
  def results

    @products = Product.where('name LIKE ?', "%#{params[:search]}%").page(params[:page]).per(9)

    if(params[:category] != "none")
      @products = Product.where('name LIKE ?', "%#{params[:search]}%")
                         .where(category_id: params[:category]).page(params[:page]).per(9)
    end

    add_breadcrumb "Search Results : \"#{params[:search]}\" "
  end
end
