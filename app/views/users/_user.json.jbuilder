json.extract! user, :id, :first_name, :last_name, :string, :middle_name, :email, :id_number, :phone_number, :kra_pin, :created_at, :updated_at
json.url user_url(user, format: :json)
