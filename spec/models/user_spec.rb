require 'rails_helper'

RSpec.describe User, :type => :model do
    it "has a valid user_type" do
        user_types = User.user_types
        user = build(:user)

        expect(user_types).to include(user.user_type)
    end
    it "has a full name" do
        user = build(:user)
        expect(user.full_name).to eq "Good Customer"

        expect(user.full_name).not_to eq "Customer Good"
    end
end