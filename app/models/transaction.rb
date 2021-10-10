class Transaction < ApplicationRecord
  belongs_to :payment
  belongs_to :client, through: :payments
end
