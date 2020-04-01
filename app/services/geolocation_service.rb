# frozen_string_literal: true

class ApiError < StandardError; end

class GeolocationService
  def initialize(address)
    @address = address
  end

  def forward
    response = LocationiqApi.new(@address).search_geolocation
    raise ApiError, response['error'] unless response.header.code == '200'

    { lat: response.first['lat'], lon: response.first['lon'] }
  end
end
