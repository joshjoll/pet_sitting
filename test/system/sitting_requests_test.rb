require "application_system_test_case"

class SittingRequestsTest < ApplicationSystemTestCase
  setup do
    @sitting_request = sitting_requests(:one)
  end

  test "visiting the index" do
    visit sitting_requests_url
    assert_selector "h1", text: "Sitting requests"
  end

  test "should create sitting request" do
    visit sitting_requests_url
    click_on "New sitting request"

    fill_in "Animal", with: @sitting_request.animal_id
    fill_in "Cost", with: @sitting_request.cost
    fill_in "Drop off", with: @sitting_request.drop_off
    fill_in "Pet name", with: @sitting_request.pet_name
    fill_in "Pickup", with: @sitting_request.pickup
    fill_in "Request status", with: @sitting_request.request_status
    fill_in "User", with: @sitting_request.user_id
    click_on "Create Sitting request"

    assert_text "Sitting request was successfully created"
    click_on "Back"
  end

  test "should update Sitting request" do
    visit sitting_request_url(@sitting_request)
    click_on "Edit this sitting request", match: :first

    fill_in "Animal", with: @sitting_request.animal_id
    fill_in "Cost", with: @sitting_request.cost
    fill_in "Drop off", with: @sitting_request.drop_off
    fill_in "Pet name", with: @sitting_request.pet_name
    fill_in "Pickup", with: @sitting_request.pickup
    fill_in "Request status", with: @sitting_request.request_status
    fill_in "User", with: @sitting_request.user_id
    click_on "Update Sitting request"

    assert_text "Sitting request was successfully updated"
    click_on "Back"
  end

  test "should destroy Sitting request" do
    visit sitting_request_url(@sitting_request)
    click_on "Destroy this sitting request", match: :first

    assert_text "Sitting request was successfully destroyed"
  end
end
