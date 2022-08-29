require "test_helper"

class PlayerGamesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get player_games_new_url
    assert_response :success
  end

  test "should get create" do
    get player_games_create_url
    assert_response :success
  end
end
