# coding: utf-8
module V1
  class CreateToken < Grape::API

    version 'v1', using: :path
    format :json
    formatter :json, Grape::Formatter::Jbuilder

    #def authenticate_error!
      # 認証が失敗したときのエラー
    #  h = {'Access-Control-Allow-Origin' => "*", 
    #       'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(",")}
    #  error!('You need to log in to use the app.', 401, h)
    #end
    
    def parameter_error
      "invalid_client"
    end

    def oauth_code_error
      "invalid_oauth_code"
    end

    def grant_type_error
      "invalid_grant_code"
    end

    def token_error
      "already_created_token"
    end

    def client_id_error
      "invalid_client_id"
    end

    def unknown_user(user_id: )
      oauth_ins = OauthCode.new
      if oauth_ins.find_user(user_id: user_id) == nil
        return true
      end
      false
    end

    def authenticate_user!(params: )
      # header から認証に必要な情報を取得
      client_id = params[:client_id]
      grant_type = params[:grant_type]
      auth_code = params[:oauth_code]
      oauth_code = OauthCode.new
      code = oauth_code.find_oauth_code(user_id: client_id)

      # 認証に失敗したらエラー
      if auth_code == code
        return true
      end
      false
    end

    def already_created_token!(user_id: )
      token = Token.new
      if token.find_user(user_id: user_id) != nil
        return true
      end
      false
    end

    def create_token(params:)
      token = Token.new

      if unknown_user(user_id: params[:client_id]) == true
        return client_id_error
      end
      
      if authenticate_user!(params: params) == false
        return oauth_code_error
      end

      if params[:grant_type] != "token"
        return grant_type_error
      end
      
      if already_created_token!(user_id: params[:client_id]) == true
        return token_error
      end

      token.create_token(user_id: params[:client_id])
      return Token.find_by(user_id: params[:client_id])
    end

    def update_token(params:)
      token = Token.new
      token.update_token(user_id: params.client_id)
      return token.find_user(user_id: params.client_id)
    end
  end
end
