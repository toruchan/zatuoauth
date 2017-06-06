class TokenController < ApplicationController
  def index
    test_token = TestTokenApp.new
    token = test_token.create_token(auth_code: "auth_code")
    render json: token
  end

  def create
    token = V1::CreateToken.new
    
    render json: token.create_token(params: params)
  end
end
