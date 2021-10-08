class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.integer :status
      t.string :external_id

      t.timestamps
    end
  end
end
