require "test_helper"

class SittingRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sitting_request = sitting_requests(:one)
  end

  test "should get index" do
    get sitting_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_sitting_request_url
    assert_response :success
  end

  test "should create sitting_request" do
    assert_difference("SittingRequest.count") do
      post sitting_requests_url, params: { sitting_request: { animal_id: @sitting_request.animal_id, cost: @sitting_request.cost, drop_off: @sitting_request.drop_off, pet_name: @sitting_request.pet_name, pickup: @sitting_request.pickup, request_status: @sitting_request.request_status, user_id: @sitting_request.user_id } }
    end

    assert_redirected_to sitting_request_url(SittingRequest.last)
  end

  test "should show sitting_request" do
    get sitting_request_url(@sitting_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_sitting_request_url(@sitting_request)
    assert_response :success
  end

  test "should update sitting_request" do
    patch sitting_request_url(@sitting_request), params: { sitting_request: { animal_id: @sitting_request.animal_id, cost: @sitting_request.cost, drop_off: @sitting_request.drop_off, pet_name: @sitting_request.pet_name, pickup: @sitting_request.pickup, request_status: @sitting_request.request_status, user_id: @sitting_request.user_id } }
    assert_redirected_to sitting_request_url(@sitting_request)
  end

  test "should destroy sitting_request" do
    assert_difference("SittingRequest.count", -1) do
      delete sitting_request_url(@sitting_request)
    end

    assert_redirected_to sitting_requests_url
  end
end
