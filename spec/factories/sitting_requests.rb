FactoryBot.define do
  factory :sitting_request do
    user_id { create(:user).id }
    animal_id { Animal.find_or_create_by(animal_type: 'Dog').id }
    pickup { "2023-05-13 16:50:00" }
    drop_off { "2023-05-13 10:51:00" }
    pet_name { "Doggo" }
    request_status { 'pending confirmation' }
    cost {80}
  end
end
