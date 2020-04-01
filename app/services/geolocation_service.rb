# frozen_string_literal: true

class GeolocationService
  def initialize(address)
    @address = address
  end

  def forward
    { lat: '52.507443', lon: '13.390391' }
  end
end
