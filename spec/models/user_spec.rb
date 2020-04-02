# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :validations do
  it 'must not allow duplicates' do
    previous_user = create(:user)
    user = User.new(device_token: previous_user.device_token)
    user.valid?
    expect(user.errors[:device_token]).to eq(['has already been taken'])
  end
end
