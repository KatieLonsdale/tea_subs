FactoryBot.define do
  factory :subscription do
    customer { nil }
    title { "MyString" }
    price { "MyString" }
    status { 1 }
    frequency { "MyString" }
  end
end
