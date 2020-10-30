require 'test_helper'

class RappersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rapper = rappers(:one)
  end

  test "should get index" do
    get rappers_url
    assert_response :success
  end

  test "should get new" do
    get new_rapper_url
    assert_response :success
  end

  test "should create rapper" do
    assert_difference('Rapper.count') do
      post rappers_url, params: { rapper: { name: @rapper.name, url: @rapper.url } }
    end

    assert_redirected_to rapper_url(Rapper.last)
  end

  test "should show rapper" do
    get rapper_url(@rapper)
    assert_response :success
  end

  test "should get edit" do
    get edit_rapper_url(@rapper)
    assert_response :success
  end

  test "should update rapper" do
    patch rapper_url(@rapper), params: { rapper: { name: @rapper.name, url: @rapper.url } }
    assert_redirected_to rapper_url(@rapper)
  end

  test "should destroy rapper" do
    assert_difference('Rapper.count', -1) do
      delete rapper_url(@rapper)
    end

    assert_redirected_to rappers_url
  end
end
