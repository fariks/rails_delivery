json.extract! vehicle, :id, :vehicleType, :maxVolume, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)