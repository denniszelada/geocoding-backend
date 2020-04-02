# frozen_string_literal: true

class ApplicationController < ActionController::API
  def authorize
    if authorization_token
      yield User.find_or_initialize_by(device_token: authorization_token)
    else
      render json: { message: 'user not authorized' }, status: 401
    end
  end

  private

  def authorization_token
    @authorization_token ||= authorization_header
  end

  def authorization_header
    request.headers['tb-device-token']
  end
end
