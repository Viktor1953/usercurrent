require "test_helper"

class SpiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spy = spies(:one)
  end

  test "should get index" do
    get spies_url
    assert_response :success
  end

  test "should get new" do
    get new_spy_url
    assert_response :success
  end

  test "should create spy" do
    assert_difference("Spy.count") do
      post spies_url, params: { spy: { mission: @spy.mission, name: @spy.name } }
    end

    assert_redirected_to spy_url(Spy.last)
  end

  test "should show spy" do
    get spy_url(@spy)
    assert_response :success
  end

  test "should get edit" do
    get edit_spy_url(@spy)
    assert_response :success
  end

  test "should update spy" do
    patch spy_url(@spy), params: { spy: { mission: @spy.mission, name: @spy.name } }
    assert_redirected_to spy_url(@spy)
  end

  test "should destroy spy" do
    assert_difference("Spy.count", -1) do
      delete spy_url(@spy)
    end

    assert_redirected_to spies_url
  end
end
