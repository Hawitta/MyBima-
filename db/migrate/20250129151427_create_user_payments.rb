class CreateUserPayments < ActiveRecord::Migration[8.0]
  def change
    create_table :user_payments do |t|
      t.integer :user_id
      t.integer :cover_id
      t.integer :amount_paid
      t.string :payment_mode
      t.datetime :date

      t.timestamps
    end
  end
end
