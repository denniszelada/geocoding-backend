# frozen_string_literal: true

require 'rails_helper'

describe 'GET /v1/geolocations/forwards?address=', type: :request do
  it 'returns the lat and lon of an address' do
    address = 'Checkpoint Charlie'

    get "/v1/geolocations/forwards?address=#{address}"

    expect(response_json).to eq(
      {
        'lat' => '52.507443',
        'lon' => '13.390391'
      }
    )
  end

  it 'returns an error message when the param is not found' do
    get '/v1/geolocations/forwards'

    expect(response_json).to eq({
                                  'message' =>
                                  'Please provide an address as parameter'
                                })
    expect(response.code.to_i).to eq 200
  end
end
