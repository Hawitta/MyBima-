json.extract! stripe, :id, :user_id, :stripe_payment_id, :card_brand, :last_4, :card_fingerprint, :paid_at, :created_at, :updated_at
json.url stripe_url(stripe, format: :json)
