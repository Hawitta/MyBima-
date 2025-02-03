class CreateCovers < ActiveRecord::Migration[8.0]
  def change
    create_table :covers do |t|
      t.integer :company_id
      t.string :type
      t.string :cover_name

      t.timestamps
    end
  end
end
