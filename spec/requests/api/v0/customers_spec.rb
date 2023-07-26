require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "get all customer subscriptions" do
    it "returns all customer subscriptions" do
      customer = create(:customer)
      active_subs = create(:subscription, status: 0, customer_id: customer.id)
      cancelled_subs = create_list(:subscription, 4, status: 1, customer_id: customer.id)

      get "/api/v0/customers/#{customer.id}/subscriptions"

      expect(response.status).to eq(200)
      data = JSON.parse(response.body, symbolize_names: true)
      subs = data[:data]

      expect(subs.count).to eq(5)
      subs.each do |sub|
        expect(sub).to have_key(:id)
        expect(sub[:type]).to eq("subscription")
        expect(sub).to have_key(:attributes)
      end

      sub_attributes = subs.dig(0, :attributes)
      attributes = [:customer_id, :title, :price, :status, :frequency]
      attributes.each do |attribute|
        expect(sub_attributes).to have_key(attribute)
      end
    end
  end
end
