class AddDescriptionToCovers < ActiveRecord::Migration[8.0]
  def change
    add_column :covers, :description, :string
  end
end
