# coding: utf-8
Rails.application.routes.draw do

  resources :oauth_codes
  resources :tokens
  devise_for :users

  namespace :api do
    # localhost:3000/api/v1/auth に認証API
    mount_devise_token_auth_for 'User', at: '/v1/oauth'
    

    mount API::Oauth => '/' #この行は下記の Grape の実装後に追加

  end
  
  resources :token
  resources :auth
  resources :token_parameter
  resources :auth_parameter

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
