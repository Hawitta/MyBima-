class RenameTypeToCategoryInCovers < ActiveRecord::Migration[8.0]
  def change
    rename_column :covers, :type, :category
  end
end
