class OrderController < ApplicationController
  before_action :set_default_status


  def add_order

    if(params[:checkout])
      # Order Table
      new_order = Order.new(user_id: current_user.id,
                            GST: current_user.profile.tax.GST,
                            PST: current_user.profile.tax.PST,
                            total_price: session[:total_price].to_f,
                            status_type_id: @order_status.id,
                            stripe_cus_id: session[:stripe_cus_id])
      new_order.save()


      #Ordered Products Table
      session[:cart].each do |item|
        product = Product.find(item["id"])

        ordered_product = OrderedProduct.new(order_id: new_order.id,
                                             product_id: product.id,
                                             price: item["price"].to_f,
                                             quantity: item["qty"].to_i)
        ordered_product.save()

        if(!ordered_product.save!)
          flash[:alert] = ordered_product.errors.message
        end

      end

      if(new_order.save!)
        flash[:notice] = "Your order has been placed."
        session[:cart] = []
      else
        flash[:alert] = new_order.errors.message
      end

    else
      flash[:alert] = "An error occured. Please try again."
    end

    redirect_to root_path

  end

  private
  def set_default_status

    if session[:paid]
      @order_status = StatusType.where(name: "Paid").first()
    else
      @order_status = StatusType.where(name: "Pending Payment").first()
    end


  end
end
