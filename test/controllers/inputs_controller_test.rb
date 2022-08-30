require "test_helper"

class InputsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get inputs_create_url
    assert_response :success
  end
end
