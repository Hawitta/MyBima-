class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :string
      t.string :middle_name
      t.string :email
      t.string :id_number
      t.integer :phone_number
      t.integer :kra_pin

      t.timestamps
    end
  end
end
