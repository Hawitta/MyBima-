class CreateCoverdetails < ActiveRecord::Migration[8.0]
  def change
    create_table :coverdetails do |t|
      t.integer :cover_id
      t.string :category
      t.string :optional
      t.integer :younger_age
      t.integer :older_age

      t.timestamps
    end
  end
end
