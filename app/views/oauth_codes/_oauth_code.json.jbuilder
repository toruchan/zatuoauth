json.extract! oauth_code, :id, :user_id, :oauth_code, :expire_oauth_code, :created_at, :updated_at
json.url oauth_code_url(oauth_code, format: :json)
