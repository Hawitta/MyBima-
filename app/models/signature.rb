class Signature < ApplicationRecord
  belongs_to :user
  validates :signature, presence: true
end
