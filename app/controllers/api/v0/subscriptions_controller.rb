class Api::V0::SubscriptionsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :find_customer

  def create
    sub = Subscription.create!(subscription_params)
    render json: SubscriptionSerializer.new(sub), status: 201
  end

  def destroy
    subscription = Subscription.find(params[:id])
    subscription.destroy!
  end

  private
  def subscription_params
    params.require(:subscription).permit(:title, :price, :frequency, :customer_id)
  end

  def record_invalid(error)
    render json: ErrorSerializer.error_message(error), status: 400
  end

  def record_not_found(error)
    render json: ErrorSerializer.error_message(error), status: 404
  end

  def find_customer
    Customer.find(params[:customer_id])
  end
end
