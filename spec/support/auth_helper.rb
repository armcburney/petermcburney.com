module AuthHelper
  def http_login
    username = ENV['USERNAME']
    password = ENV['PASSWORD']

    request.env['HTTP_AUTHORIZATION'] =
      ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
  end
end
