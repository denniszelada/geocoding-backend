# frozen_string_literal: true

module Api
  module V1
    module Geolocations
      # Provides the forward geolocation from an address
      class ForwardsController < ApplicationController
        def index
          if params.key?(:address)
            @geolocation = GeolocationService.new(addres: params[:address])
                                             .forward
          else
            render json: { message: 'Please provide an address as parameter' },
                   status: 200
          end
        end
      end
    end
  end
end
