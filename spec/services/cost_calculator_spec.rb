require 'rails_helper'

RSpec.describe CostCalculator, type: :model do
  describe '#call' do
    it "calculates the cost for 6 hours" do
        request = build(:sitting_request)
        request.pickup = 6.hours.after(request.drop_off)
  
        expect(CostCalculator.call(request)).to eq request.cost
    end
    
    it "calculates the cost for 3 hours" do
        request = build(:sitting_request)
        request.pickup = 3.hours.after(request.drop_off)

        expect(CostCalculator.call(request)).to eq 50
    end

    it "calculates the cost for a rounded up hour" do
        request = build(:sitting_request)
        # setting it to 3h 1m to ensure it rounds up to 4 hours
        request.pickup = 181.minutes.after(request.drop_off)

        expect(CostCalculator.call(request)).to eq 60
    end

    it "uses a base cost" do
        request = build(:sitting_request)
        # setting it to 3h 1m to ensure it rounds up to 4 hours
        request.pickup = 0.minutes.after(request.drop_off)

        expect(CostCalculator.call(request)).to eq 20
    end
  end
end