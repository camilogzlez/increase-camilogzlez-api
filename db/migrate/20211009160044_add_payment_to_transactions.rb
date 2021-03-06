# frozen_string_literal: true

class AddPaymentToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_reference :transactions, :payment, null: false, foreign_key: true
  end
end
