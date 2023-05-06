require 'rails_helper'

RSpec.describe Animal, :type => :model do
    describe 'validate animal attributes' do
        it "has an animal type" do
            animal = build(:animal)
            expect(animal.animal_type).to eq "Dog"
        end
        it "has an hourly cost" do
            animal = build(:animal)
            expect(animal.hourly_cost).to eq 10
        end
    end

end