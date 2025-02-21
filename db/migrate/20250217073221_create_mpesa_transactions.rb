class CreateMpesaTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :mpesa_transactions do |t|
      t.string :checkout_request_id
      t.string :merchant_request_id
      t.string :phone_number
      t.decimal :amount
      t.string :response_code
      t.string :response_description
      t.string :customer_message

      t.timestamps
    end
  end
end
