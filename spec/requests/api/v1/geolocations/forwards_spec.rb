# frozen_string_literal: true

require 'rails_helper'

describe 'GET /v1/geolocations/forwards?address=', type: :request do
  let(:address) { 'checkpoint charlie' }
  let(:device_token) { '123abcd456xyz' }
  let(:owner) { create(:user, device_token: device_token) }

  it 'returns the lat and lon of an address' do
    VCR.use_cassette 'checkpoint charlie' do
      get '/v1/geolocations/forwards',
          params: { 'address' => address },
          headers: {
            'tb-device-token' => device_token,
            'Content-type' => 'application/json'
          }

      expect(response_json).to eq(
        {
          'lat' => '52.5075075',
          'lon' => '13.3903737'
        }
      )
    end
  end

  it 'returns an error message when the param is not found' do
    get '/v1/geolocations/forwards',
        params: {},
        headers: {
          'tb-device-token' => device_token,
          'Content-type' => 'application/json'
        }

    expect(response_json).to eq({
                                  'message' =>
                                  'Please provide an address as parameter'
                                })
    expect(response.code.to_i).to eq 200
  end

  it 'returns an error message if there was an error with the request' do
    VCR.use_cassette 'error request' do
      get '/v1/geolocations/forwards',
          params: { 'address' => 'kssjjdkd' },
          headers: {
            'tb-device-token' => device_token,
            'Content-type' => 'application/json'
          }

      expect(response_json).to eq({ 'message' => 'Unable to geocode' })
      expect(response.code.to_i).to eq 404
    end
  end

  it 'returns user not authorized when the user is unauthenticated' do
    get '/v1/geolocations/forwards',
        params: { 'address' => address },
        headers: {
          'Content-type' => 'application/json'
        }

    expect(response_json).to eq({
                                  'message' =>
                                  'user not authorized'
                                })
    expect(response.code.to_i).to eq 401
  end
end
