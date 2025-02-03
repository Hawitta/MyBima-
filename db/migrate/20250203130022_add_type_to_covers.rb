class AddTypeToCovers < ActiveRecord::Migration[8.0]
  def change
    add_column :covers, :type, :string
  end
end
