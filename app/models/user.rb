# frozen_string_literal: true

class User < ApplicationRecord
  validates :device_token, uniqueness: true, allow_blank: true
end
