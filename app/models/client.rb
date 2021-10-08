class Client < ApplicationRecord
  has_many :payments, foreign_key: :external_id
  has_many :transactions, through: :payments, foreign_key: :external_id
  has_many :discounts, through: :payments, foreign_key: :external_id 
end
