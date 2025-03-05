class AddUserNameToSignatures < ActiveRecord::Migration[8.0]
  def change
    add_column :signatures, :user_name, :string
  end
end
