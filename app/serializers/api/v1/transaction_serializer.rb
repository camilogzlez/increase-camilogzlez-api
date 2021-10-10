module Api
  module V1
    class TransactionSerializer < ApplicationSerializer
      attributes :id,
                 :amount,
                 :status,
                 :external_id,
                 :payment
    end
  end
end