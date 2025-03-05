class Cover < ApplicationRecord
    belongs_to :insurance_company, foreign_key: "company_id"
    has_many :user_payments
end
