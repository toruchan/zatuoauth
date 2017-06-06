json.extract! token, :id, :user_id, :access_token, :refresh_token, :expire_access_token, :expire_refresh_token, :created_at, :updated_at
json.url token_url(token, format: :json)
