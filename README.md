# README

## Requirements
This app uses the following technologies and gems:

    - Ruby 3.0.0
    - Rails 7.0.4
    - Devise
    - Bootstrap 5
    - Yarn
    - NPM

## Getting Started
From the terminal, check out the repository from Github

    git clone git@github.com:joshjoll/pet_sitting.git

Check your local Ruby version with your preferred ruby version manager. This app uses Ruby 3.0.0

Install all required gems by running:

    bundle install

Install NPM packages by running:

    yarn

Navigate to the directory in the terminal, then run:

    rails db:create db:migrate db:seed

At this point, the app should be ready to run and can be started using:

    rails s

## Use
This app is a basic pet sitting scheduling app. It consists of three models:

    - User
    - Animal
    - Sitting Request

The User model leverages devise for user authentication, and includes a `user_type` column in the database to differentiate employees from customers.

The Animal model is used to calculate the cost to sit different animals, and only uses two columns: `animal_type` and `hourly_rate`.

The Sitting Request model is what makes the app function. It holds important information about the customer request, including the `user_id` and the `animal_id`. It also holds all of the `pickup` and `drop_off` datetime objects, the `pet_name`, the total `cost`, as well as the `request_status`.

The general workflow is:

1. A user creates an account from the landing page

- Note: the seed file will create 1 employee and 2 customer user accounts. There is no UI user management functionality that would allow a new account to be made into an employee account.

> Seeded data can be found in the `db/seeds.rb` file

2. A customer clicks the `Request our Services` button from the landing page, and is taken to the Sitting Request form
3. After filling out the form (all fields are required and validated on the backend), the user is taken to the SittingRequest#confirmation view. At this point, the request is in a `pending confirmation` status, and the customer is shown the total cost for their request.
4. Once the user clicks the `Confirm Request` button, the order is moved to a `pending acceptance` status; At this point a User account with an `employee` `user_type` can view the all Requests from the Sitting Request#index view.
5. The employee then should either mark the request as either `accepted` or `rejected` from the SittingRequest#show view.
6. The customer has a button on their Sitting Request#show view that will allow them to move the `request_status` to `cancelled`.

Cost calculations are managed by the `CostCalculator` service class. This class is called from the SittingRequest controller on the #create and #update actions. It accepts a SittingRequest object returns the total cost. The hourly rates are pulled from the Animal table in the database, and the `base_cost` is hard coded at $20.

## Testing
This app uses the following technologies for testing:

    - Rspec 3.12.0
    - Rspec-rails 6.0.2
    - Factorybot
    - Capybara

Test coverage includes

    - Unit tests for the models and the CostCalculator
    - Feature tests for the Sitting Request From