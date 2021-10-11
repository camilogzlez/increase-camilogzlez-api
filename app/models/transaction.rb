# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :payment
  enum status: %i[Created Approved Declined]
end
