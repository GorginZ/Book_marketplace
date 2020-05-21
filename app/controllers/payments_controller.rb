class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

    def get_stripe_id
        @listing = Listing.find(params[:id])
        session_id = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          customer_email: current_user.email,
          line_items: [{
            name: @listing.title,
            description: @listing.keywords,
            amount: @listing.price * 100,
            currency: 'aud',
            quantity: 1,
          }],
          payment_intent_data: {
            metadata: {
              user_id: current_user.id,
              listing_id: @listing.id
            }
          },
          success_url: "#{root_url}/orders/my_orders?userId=#{current_user.id}&listingId=#{@listing.id}",
          cancel_url: "#{root_url}listings"
        ).id
        render :json => {id: session_id, stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key)}
      end
      
def success
  redirect_to my_orders_path
end
#the webhook action changes the availability attribute of the instance variable 'availability' to 'false' and saves the listing object.
def webhook
  payment_id = params[:data][:object][:payment_intent]
  payment = Stripe::PaymentIntent.retrieve(payment_id)
  listing_id = payment.metadata.listing_id
  user_id = payment.metadata.user_id
  Order.create(listing_id: listing_id, user_id: user_id)
  listing = Listing.find(listing_id)
  listing.available = false
  listing.save
  

  head 200
end



def failure
end


end