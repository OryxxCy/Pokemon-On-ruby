require "test_helper"

class MovesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get moves_index_url
    assert_response :success
  end

  test "should get show" do
    get moves_show_url
    assert_response :success
  end
end
