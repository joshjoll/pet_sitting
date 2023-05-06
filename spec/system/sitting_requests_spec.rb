require 'rails_helper'

RSpec.describe "SittingRequests", type: :system do
  before do
    driven_by(:rack_test)
    @user = create(:user)
    login_as(@user, :scope => :user)
  end
end
