require 'rails_helper'

RSpec.describe SittingRequest, :type => :model do
    
    describe 'drop_off and pickup times' do
        it "are datetime objects" do
            request = build(:sitting_request)
            expect(request.pickup).to eq DateTime.parse('2023-05-13 16:50:00')

            expect(request.drop_off).to eq DateTime.parse('2023-05-13 10:51:00')
        end

        describe '#more_than_two_hours?' do
            it 'are greater than 2 hours' do
                request = build(:sitting_request)
                expect(request).to be_more_than_two_hours
            end
            it "are less than 2 hours" do
                request = build(:sitting_request)
                request.pickup = 1.hour.after(request.drop_off)
                expect(request).not_to be_more_than_two_hours
            end
        end

        describe '#less_than_eight_hours?' do
            it "are less than 8 hours" do
                request = build(:sitting_request)
                expect(request).to be_less_than_eight_hours
            end
            it 'are greater than 8 hours' do
                request = build(:sitting_request)
                request.pickup = 9.hours.after(request.drop_off)
                expect(request).not_to be_less_than_eight_hours
            end
        end
        
        describe '#chronologically_correct?' do
            it "are in chronological order" do
                request = build(:sitting_request)
                expect(request).to be_chronologically_correct
            end
            it 'are not in chronological order' do
                request = build(:sitting_request)
                request.pickup = 3.hours.before(request.drop_off)
                expect(request).not_to be_chronologically_correct
            end
        end
        describe '#in_the_future?' do
            it "are in the future" do
                request = build(:sitting_request)
                expect(request).to be_in_the_future
            end
            it 'are in the past' do
                request = build(:sitting_request)
                request.drop_off = 3.hours.before(DateTime.now)
                expect(request).not_to be_in_the_future
            end
        end
    end

    it "uses drop_off for the dropoff" do
        request = build(:sitting_request)
        expect(request.dropoff).to eq request.drop_off
    end
    

end