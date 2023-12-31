class Customer < ApplicationRecord
  has_many :subscriptions
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :address
end
