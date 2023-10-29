class CheckoutController < ApplicationController 
  def create 
    product = Product.find(params[:id])
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'usd',
          product_data: {
            name: product.name,
          },
          unit_amount: product.price, # Assuming your product.price is in cents
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: root_url,
      cancel_url: root_url,
    })
    if @session 
      product.increment(:sales_count)
      product.save!
    end
    respond_to do |format|
      format.js 
    end
  end
end
