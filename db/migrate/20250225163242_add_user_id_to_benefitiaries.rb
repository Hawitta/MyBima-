class AddUserIdToBenefitiaries < ActiveRecord::Migration[8.0]
  def change
    add_column :benefitiaries, :user_id, :integer
  end
end
