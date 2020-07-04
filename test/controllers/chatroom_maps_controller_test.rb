require 'test_helper'

class ChatroomMapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chatroom_map = chatroom_maps(:one)
  end

  test "should get index" do
    get chatroom_maps_url, as: :json
    assert_response :success
  end

  test "should create chatroom_map" do
    assert_difference('ChatroomMap.count') do
      post chatroom_maps_url, params: { chatroom_map: { chatroom_id: @chatroom_map.chatroom_id, user_id: @chatroom_map.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show chatroom_map" do
    get chatroom_map_url(@chatroom_map), as: :json
    assert_response :success
  end

  test "should update chatroom_map" do
    patch chatroom_map_url(@chatroom_map), params: { chatroom_map: { chatroom_id: @chatroom_map.chatroom_id, user_id: @chatroom_map.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy chatroom_map" do
    assert_difference('ChatroomMap.count', -1) do
      delete chatroom_map_url(@chatroom_map), as: :json
    end

    assert_response 204
  end
end
