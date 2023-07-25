require 'rails_helper'

RSpec.describe "Subscriptions", type: :request do
  describe "new subscription" do
    it "creates a new subscription for a customer" do
      customers = create_list(:customer, 3)
      customer = customers.sample
      expect(Subscription.count).to eq(0)

      headers = {"CONTENT_TYPE" => "application/json"}
      sub_params = ({"title" => "basic",
                      "price" => "$5.99",
                      "frequency" => "monthly",
                      "customer_id" => "#{customer.id}"
                    })
      post "/api/v0/customers/#{customer.id}/subscriptions", headers: headers, params: JSON.generate(subscription: sub_params)
      
      new_sub = Subscription.last
      expect(new_sub.customer_id).to eq(customer.id)
      expect(new_sub.title).to eq("basic")
      expect(new_sub.price).to eq("$5.99")
      expect(new_sub.status).to eq("active")
      expect(new_sub.frequency).to eq("monthly")
      expect(Subscription.count).to eq(1)

      expect(response.status).to eq(201)
      data = JSON.parse(response.body, symbolize_names: true)
      created_sub = data[:data]

      expect(created_sub[:id]).to eq(new_sub.id.to_s)
      expect(created_sub[:type]).to eq("subscription")
      
      attributes = [:customer_id, :title, :price, :status, :frequency]

      attributes.each do |attribute|
        expect(created_sub[:attributes]).to have_key(attribute)
      end
    end
    xit 'returns an error if a required param is missing' do
      customer = create(:customer)
      expect(Subscription.count).to eq(0)

      headers = {"CONTENT_TYPE" => "application/json"}
      sub_params = ({"title" => "basic",
                      "price" => "$5.99",
                      "customer_id" => "#{customer.id}"
                    })
      post "/api/v0/customers/#{customer.id}/subscriptions", headers: headers, params: JSON.generate(subscription: sub_params)
      
      expect(Subscription.count).to eq(0)

      expect(response.status).to eq(400)
      data = JSON.parse(response.body, symbolize_names: true)
      expect(data.dig(:errors, 0, :detail)).to eq("Validation failed.")
    end
  end
end
