json.extract! user_payment, :id, :user_id, :cover_id, :amount_paid, :payment_mode, :date, :created_at, :updated_at
json.url user_payment_url(user_payment, format: :json)
