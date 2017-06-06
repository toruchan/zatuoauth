require 'test_helper'

class OauthCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @oauth_code = oauth_codes(:one)
  end

  test "should get index" do
    get oauth_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_oauth_code_url
    assert_response :success
  end

  test "should create oauth_code" do
    assert_difference('OauthCode.count') do
      post oauth_codes_url, params: { oauth_code: { expire_oauth_code: @oauth_code.expire_oauth_code, oauth_code: @oauth_code.oauth_code, user_id: @oauth_code.user_id } }
    end

    assert_redirected_to oauth_code_url(OauthCode.last)
  end

  test "should show oauth_code" do
    get oauth_code_url(@oauth_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_oauth_code_url(@oauth_code)
    assert_response :success
  end

  test "should update oauth_code" do
    patch oauth_code_url(@oauth_code), params: { oauth_code: { expire_oauth_code: @oauth_code.expire_oauth_code, oauth_code: @oauth_code.oauth_code, user_id: @oauth_code.user_id } }
    assert_redirected_to oauth_code_url(@oauth_code)
  end

  test "should destroy oauth_code" do
    assert_difference('OauthCode.count', -1) do
      delete oauth_code_url(@oauth_code)
    end

    assert_redirected_to oauth_codes_url
  end
end
