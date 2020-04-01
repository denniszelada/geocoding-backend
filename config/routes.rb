Rails.application.routes.draw do
  scope module: :api, defaults: { format: 'json' } do
    namespace :v1 do
      namespace :geolocations do
        resources :forwards, only: [:index]
      end
    end
  end
end
