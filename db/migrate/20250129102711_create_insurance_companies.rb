class CreateInsuranceCompanies < ActiveRecord::Migration[8.0]
  def change
    create_table :insurance_companies do |t|
      t.integer :company_id
      t.string :company_name
      t.string :logo
      t.string :website
      t.string :email

      t.timestamps
    end
    add_index :insurance_companies, :company_id
  end
end
