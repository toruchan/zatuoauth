class AuthController < ApplicationController
  def index
    oauth = V1::Oauth.new
    render json: oauth.oauth(params: params,request: request)
    #url = "http://localhost:3000?auth_code=auth_code"

    #auth = TestAuthentication.new
    #if auth.check_parameter(params: params) != ""
    #  error = {
    #    error_code: auth.check_parameter(params: params)
    #  }
    #  render json: error
    #  return
    #end
    #
    #auth_code = auth.response_code
    #render json: auth_code
  end
end
