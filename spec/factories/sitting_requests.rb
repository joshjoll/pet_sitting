FactoryBot.define do
  factory :sitting_request do
    user 
    animal 
    pickup { "2023-05-13 16:50:00" }
    drop_off { "2023-05-13 10:51:00" }
    pet_name { "Doggo" }
    request_status { 'pending confirmation' }
    cost {100}
  end
end
