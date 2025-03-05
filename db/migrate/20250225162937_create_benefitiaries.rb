class CreateBenefitiaries < ActiveRecord::Migration[8.0]
  def change
    create_table :benefitiaries do |t|
      t.string :surname
      t.string :first_name
      t.string :relationship
      t.integer :id_no
      t.integer :phone_number
      t.integer :postal_address

      t.timestamps
    end
  end
end
