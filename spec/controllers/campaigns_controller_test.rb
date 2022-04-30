require "test_helper"

class CampaignsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign = campaigns(:one)
  end

  test "should get index" do
    get campaigns_url, as: :json
    assert_response :success
  end
end
