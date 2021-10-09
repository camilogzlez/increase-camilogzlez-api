class AddPaymentToDiscounts < ActiveRecord::Migration[6.1]
  def change
    add_reference :discounts, :payment, null: false, foreign_key: true
  end
end
