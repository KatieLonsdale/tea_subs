class Api::V0::SubscriptionsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  def create
    sub = Subscription.create!(subscription_params)
    render json: SubscriptionSerializer.new(sub), status: 201
  end

  private
  def subscription_params
    params.require(:subscription).permit(:title, :price, :frequency, :customer_id)
  end

  def record_invalid(error)
    render json: ErrorSerializer.error_message(error), status: 400
  end
end
