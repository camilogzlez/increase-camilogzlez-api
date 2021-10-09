class AddClientToPayments < ActiveRecord::Migration[6.1]
  def change
    add_reference :payments, :client, null: false, foreign_key: true
  end
end
