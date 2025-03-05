class User < ApplicationRecord
    has_many :user_payments
    has_many :dependants
    has_many :beneficiarys
    has_many :signatures

    has_one_attached :attached_id
    has_one_attached :attached_kra
end
