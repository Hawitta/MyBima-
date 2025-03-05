class AddRelationshipToDependant < ActiveRecord::Migration[8.0]
  def change
    add_column :dependants, :relationship, :string
  end
end
