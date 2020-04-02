# frozen_string_literal: true

FactoryBot.define do
  sequence :token do
    SecureRandom.hex(3)
  end

  factory :user do
    device_token { generate(:token) }
  end
end
