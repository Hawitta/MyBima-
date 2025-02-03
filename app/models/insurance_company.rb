class InsuranceCompany < ApplicationRecord
    has_many :covers, foreign_key: "company_id"
end
