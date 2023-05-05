# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# create users
users = [
    {
        email: "employee@employee.com",
        first_name: "Perfect",
        last_name: "Employee",
        password: "password",
        user_type: 2
    },
    {
        email: "good_customer@customer.com",
        first_name: "Pretty Good",
        last_name: "Customer",
        password: "password",
        user_type: 1
    },
    {
        email: "bad_customer@customer.com",
        first_name: "Less Good",
        last_name: "Customer",
        password: "password",
        user_type: 1
    }
]

users.each do |user|
    new_user = User.find_or_create_by(email: user[:email])
    new_user.update(user)
end
# create animals
animals = [
    {
        animal_type: "Dog",
        hourly_cost: 10,
    },
    {
        animal_type: "Cat",
        hourly_cost: 5,
    }
]

animals.each do |animal|
    Animal.find_or_create_by(animal)
end

customer_one = User.find_by(email: 'good_customer@customer.com').id
customer_two = User.find_by(email: 'bad_customer@customer.com').id

dog = Animal.find_by(animal_type: 'Dog').id
cat = Animal.find_by(animal_type: 'Cat').id

sitting_requests = [
    {
        user_id: customer_one,
        animal_id: dog,
        pet_name: "Quackers",
        drop_off: DateTime.parse('2023-05-13 09:00:00 AM'),
        pickup: DateTime.parse('2023-05-13 2:00:00 PM'),
        request_status: 'accepted',
        cost: 70
    },
    {
        user_id: customer_one,
        animal_id: cat,
        pet_name: "Whiskers",
        drop_off: DateTime.parse('2023-05-13 09:00:00 AM'),
        pickup: DateTime.parse('2023-05-13 2:00:00 PM'),
        request_status: 'accepted',
        cost: 45
    },
    {
        user_id: customer_two,
        animal_id: dog,
        pet_name: "Fence Post",
        drop_off: DateTime.parse('2023-05-13 11:00:00 AM'),
        pickup: DateTime.parse('2023-05-13 1:00:01 PM'),
        request_status: 'cancelled',
        cost: 40
    },
    {
        user_id: customer_two,
        animal_id: cat,
        pet_name: "Stockings",
        drop_off: DateTime.parse('2023-05-13 11:00:00 PM'),
        pickup: DateTime.parse('2023-05-14 4:00:00 AM'),
        request_status: 'rejected',
        cost: 45
    }
]
sitting_requests.each do |request|
    SittingRequest.create(request)
end
