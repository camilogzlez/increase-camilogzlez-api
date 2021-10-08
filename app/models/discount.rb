class Discount < ApplicationRecord
  belongs_to :payment, foreign_key: :external_id
  belongs_to :client,  foreign_key: :external_id 
end
