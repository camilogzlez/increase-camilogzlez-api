class Payment < ApplicationRecord
  belongs_to :client, foreign_key: :external_id
  has_many :transactions, foreign_key: :external_id
  has_many :discounts, foreign_key: :external_id
end
