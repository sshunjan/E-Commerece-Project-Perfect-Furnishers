class OrderController < ApplicationController
  before_action :set_default_status


  def add_order

    if(params[:checkout])
      # Order Table
      new_order = Order.new(user_id: 1,
                        total_price: session[:total_price],
                        status_type_id: @order_status.id)
      new_order.save()


      #Ordered Products Table
      session[:cart].each do |item|
        product = Product.find(item["id"])

        ordered_product = OrderedProduct.new()
        ordered_product.order_id = order.id
        ordered_product.product_id = product.id
        ordered_product.price = item[:price]
        ordered_product.quantity = item[:quantity]

        ordered_product.save()
      end

      if(@order.save!)
        flash[:notice] = "Your order has been placed."
      end

    end

    redirect_to root_path
  end

  private
  def set_default_status
    @order_status = StatusType.where(name: "Pending Payment").first()
  end
end
