class AddRememberCreatedAtToAdmins < ActiveRecord::Migration[8.0]
  def change
    add_column :admins, :remember_created_at, :datetime
  end
end
