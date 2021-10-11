# frozen_string_literal: true

module Api
  module V1
    class TransactionsByClientSerializer < ApplicationSerializer
      attributes :id,
                 :first_name,
                 :last_name,
                 :external_id,
                 :transactions
    end
  end
end
