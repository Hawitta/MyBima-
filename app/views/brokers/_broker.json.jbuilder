json.extract! broker, :id, :broker_name, :unit_name, :signature, :created_at, :updated_at
json.url broker_url(broker, format: :json)
