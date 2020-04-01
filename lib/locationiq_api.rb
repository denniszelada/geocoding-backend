# frozen_string_literal: true

class LocationiqApi
  include HTTParty

  base_uri ENV['LOCATIONIQ_URL']
  attr_accessor :address

  def initialize(address)
    @options = { query:
                 { key: ENV['PRIVATE_TOKEN'], q: address, format: 'json' } }
  end

  def search_geolocation
    self.class.get('/search.php', @options)
  end
end
