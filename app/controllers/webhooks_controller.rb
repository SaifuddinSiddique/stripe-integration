class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    endpoint_secret = 'whsec_MKwNm9rBWNw7jztS778FvL0iYCoShCXx'
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, endpoint_secret
      )
    rescue JSON::ParserError => e
      return status 400
    rescue Stripe::SignatureVerificationError => e
      return status 400
    end

    case event.type
    when 'checkout.session.completed'
      debugger
      session = event.data.object
      @product = Product.find_by(price: session.amount_total)
      @product.increment(:sales_count)
    end
    render json: { message: 'success' }
  end
end
