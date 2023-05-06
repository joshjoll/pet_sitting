FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "customer#{n}@customer.com" }
    first_name { "Good" }
    last_name { "Customer" }
    user_type { "customer" }
    password { "password" }
  end
end
