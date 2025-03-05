class CreateDependants < ActiveRecord::Migration[8.0]
  def change
    create_table :dependants do |t|
      t.integer :user_id
      t.string :surname
      t.string :first_name
      t.string :dob
      t.string :id_no
      t.string :blood_group

      t.timestamps
    end
  end
end
