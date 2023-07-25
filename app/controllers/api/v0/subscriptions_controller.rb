class Api::V0::SubscriptionsController < ApplicationController
  def create
    sub = Subscription.create!(subscription_params)
    render json: SubscriptionSerializer.new(sub), status: 201
  end

  private
  def subscription_params
    params.require(:subscription).permit(:title, :price, :frequency, :customer_id)
  end
end
