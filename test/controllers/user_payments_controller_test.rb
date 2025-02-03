require "test_helper"

class UserPaymentsControllerTest < ActionDispatch::IntegrationTest
  test "should get insurance_cover" do
    get user_payments_insurance_cover_url
    assert_response :success
  end
end
