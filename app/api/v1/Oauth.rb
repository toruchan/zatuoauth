# coding: utf-8
module V1
  class Oauth < Grape::API

    version 'v1', using: :path
    format :json
    formatter :json, Grape::Formatter::Jbuilder

    #helpers do
    def authenticate_error!
      # 認証が失敗したときのエラー
      h = {'Access-Control-Allow-Origin' => "*", 
           'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(",")}
      error!('You need to log in to use the app.', 401, h)
    end
    
    def parameter_error
      "invalid_parameter"
    end

    def client_id_error
      "invalid_client_id"
    end
    
    def redirect_url_error
      "invalid_redirect_url"
    end

    def response_type_error
      "invalid_response_type"
    end

    def authenticate_user!
      # header から認証に必要な情報を取得
      #uid = @request.headers['Uid']
      #token = @request.headers['Access-Token']
      #client = @request.headers['Client']
      #@user = User.find_by_uid(uid)

      # 認証に失敗したらエラー
      #unless @user && @user.valid_token?(token, client)
      #  authenticate_error!
      #end
    end

    def check_parameter(params:)
      unless params[:client_id] && params[:redirect_url] && params[:response_type]
        return parameter_error
      end

      unless params[:client_id] == "test"
        return client_id_error
      end

      unless params[:redirect_url] == "aaaa"
        return redirect_url_error
      end

      unless params[:response_type] == "code"
        return response_type_error
      end

      return ""        
    end

    #end

    #desc 'GET /api/v1/test'
    #get 'test' do

    def oauth(params: ,request:)
      @params = params
      @request = request
      oauth_code = OauthCode.new
      if check_parameter(params: params) != ""
        error_code = check_parameter(params: params)
        return "http://localhost:3000/auth_parameter?error_code=#{error_code}"
      end
      "login page"
    end

    def create_oauth_code
      #authenticate_user!
      if oauth_code.find_user(user_id: @request.headers['Uid']) == nil
        oauth_code.create_oauth_code(user_id: @request.headers['Uid'])
      else
        oauth_code.update_oauth_code(user_id: @request.headers['Uid'])
      end
      code = oauth_code.find_oauth_code(user_id: @request.headers['Uid'])
      "#{params[:redirect_url]}?auth_code=#{code}"
    end
    # サンプルなので、単純に root.rb に記述
  end
end
