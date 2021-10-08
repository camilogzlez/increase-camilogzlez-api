class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.integer :currency
      t.integer :amount
      t.integer :net_amount
      t.integer :total_discounts
      t.string :external_id

      t.timestamps
    end
  end
end
