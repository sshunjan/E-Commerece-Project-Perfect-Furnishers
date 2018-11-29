class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    amount = (session[:total_price].to_f * 100 ).round(0)

    @customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    @charge = Stripe::Charge.create(
      :customer    => @customer.id,
      :amount      => amount,
      :description => 'Rails Stripe customer',
      :currency    => 'cad'
    )

    session[:stripe_cus_id] = @customer.id
    session[:paid] = @charge["paid"]

    if(@charge["amount"] == amount)
      redirect_to order_add_order_path(checkout: "checkout")
    else
      flash[:alert] = "An error occured while processing payment. Please try again."
      redirect_to root_path
    end

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to root_path
  end


end
