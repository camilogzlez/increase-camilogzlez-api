class Client < ApplicationRecord
  # validates :external_id, :uniqueness => true
  has_many :payments
  has_many :transactions, through: :payments
  has_many :discounts, through: :payments
end
