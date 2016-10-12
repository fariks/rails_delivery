json.extract! address, :id, :rawLine1, :city, :state, :zip, :country, :created_at, :updated_at
json.url address_url(address, format: :json)