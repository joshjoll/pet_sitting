require 'rails_helper'

RSpec.describe "SittingRequests", type: :system do
  before do
    driven_by(:rack_test)
    @user = create(:user)
    login_as(@user, :scope => :user)
  end

  it "submits a valid form" do
    request = build(:sitting_request)
    request.pickup = 4.hours.after(request.drop_off)

    # Open form view
    visit sitting_requests_path
    click_link('New sitting request')
    expect(current_path).to have_content('/sitting_requests/new')

    # Populate Form
    # use @user because we only show requests for the logged in user (unless the user is employee user_type)
    find('#hidden_user_id', visible: false).set(@user.id)
    fill_in 'Pet name', with: request.pet_name
    select "Dog", :from => "Animal"
    fill_in 'Drop off', with: request.drop_off
    fill_in 'Pickup', with: request.pickup
    # Submit form
    click_button("Create")

    # To the confirmation view
    expect(current_path).to have_content('/confirmation')
    # confirm cost is correct
    expect(page).to have_content('Cost: 60')
    # Hit confirm
    click_button("Confirm Request")

    expect(current_path).to have_content('/sitting_requests')
    expect(page).to have_content(request.pet_name)
  end
  
end
