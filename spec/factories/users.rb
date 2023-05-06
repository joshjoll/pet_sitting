FactoryBot.define do
  factory :user do
    email { "customer@customer.com" }
    first_name { "Good" }
    last_name { "Customer" }
    user_type { "customer" }
  end
end
