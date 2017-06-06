require 'test_helper'

class TokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @token = tokens(:one)
  end

  test "should get index" do
    get tokens_url
    assert_response :success
  end

  test "should get new" do
    get new_token_url
    assert_response :success
  end

  test "should create token" do
    assert_difference('Token.count') do
      post tokens_url, params: { token: { access_token: @token.access_token, expire_access_token: @token.expire_access_token, expire_refresh_token: @token.expire_refresh_token, refresh_token: @token.refresh_token, user_id: @token.user_id } }
    end

    assert_redirected_to token_url(Token.last)
  end

  test "should show token" do
    get token_url(@token)
    assert_response :success
  end

  test "should get edit" do
    get edit_token_url(@token)
    assert_response :success
  end

  test "should update token" do
    patch token_url(@token), params: { token: { access_token: @token.access_token, expire_access_token: @token.expire_access_token, expire_refresh_token: @token.expire_refresh_token, refresh_token: @token.refresh_token, user_id: @token.user_id } }
    assert_redirected_to token_url(@token)
  end

  test "should destroy token" do
    assert_difference('Token.count', -1) do
      delete token_url(@token)
    end

    assert_redirected_to tokens_url
  end
end
