class CreateStripes < ActiveRecord::Migration[8.0]
  def change
    create_table :stripes do |t|
      t.integer :user_id
      t.string :stripe_payment_id
      t.string :card_brand
      t.string :last_4
      t.string :card_fingerprint
      t.datetime :paid_at

      t.timestamps
    end
  end
end
