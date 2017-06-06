module API
  class Oauth < Grape::API
    mount V1::Oauth
  end
end
