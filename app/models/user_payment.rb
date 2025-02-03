class UserPayment < ApplicationRecord
    has_many :users, foreign_key: "user_id"
    belongs_to :cover, foreign_key: "cover_id"
end
