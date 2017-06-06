class TestAuthentication
  def response_code
    auth = {
      auth_code: create_auth_code
    }
  end
  
  def create_auth_code
    "auth_code"
  end

  def check_parameter(params: params)
    if params[:client_id] != "hoge"
      return "invalid_client_id"
    end

    if params[:redirect_url] != "fuga"
      return "invalid_redirect_url"
    end

    if params[:response_type] != "umi"
      return "invalid_response_type"
    end
    
    return ""
  end
end
