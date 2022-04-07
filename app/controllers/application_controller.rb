class ApplicationController < ActionController::Base
  private

  def authenticate!
    http_basic_authenticate_or_request_with name: ENV.fetch("HTTP_BASIC_AUTH_NAME", ""),
      password: ENV.fetch("HTTP_BASIC_AUTH_PASSWORD", ""),
      message: "Your credentials to access located in ENV vars. Check out the Readme for more details."
  end
end
