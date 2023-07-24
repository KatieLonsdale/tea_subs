require 'rails_helper'

RSpec.describe Subscription do
  describe "relationships" do
    it { should belong_to(:customer) }
  end
end
