# frozen_string_literal: true

module Api
  module V1
    module Geolocations
      # Provides the forward geolocation from an address
      class ForwardsController < ApplicationController
        def index
          authorize do |_user|
            if params.key?(:address)
              @geolocation = GeolocationService.new(params[:address]).forward
            else
              render_missing_parameter
            end
          rescue ApiError => e
            render json: { message: e.message }, status: :not_found
          end
        end

        private

        def render_missing_parameter
          render json: {
            message: 'Please provide an address as parameter'
          }, status: 200
        end
      end
    end
  end
end
