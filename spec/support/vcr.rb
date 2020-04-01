# frozen_string_literal: true

VCR.configure do |config|
  config.cassette_library_dir = Rails.root.join('spec', 'vcr')
  config.hook_into :webmock
end
