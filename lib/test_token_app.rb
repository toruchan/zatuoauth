class TestTokenApp
  def create_token
    access_token = create_access_token
    refresh_token = create_refresh_token

    return token = {
             access_token: access_token,
             refresh_token: refresh_token,
             expiration_date_access: Date.today + 1,
             expiration_date_refresh: Date.today + 30
           }
    return token = {
             error_code: "invalid_auth_code"
           }
  end

  def check_parameter(params:)
    if params[:client_id] != "hoge"
      return "invalid_client_id"
    end

    if params[:grant_type] != "hono"
      return "invalid_grat_type"
    end

    if params[:auth_code] != "auth_code"
      return "invalid_auth_code"
    end
    
    return ""
  end
  
  def create_access_token
    "access_token"
  end

  def create_refresh_token
    "refresh_token"
  end
end
