class AddDetailsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :title, :string
    add_column :users, :gender, :string
    add_column :users, :dob, :string
    add_column :users, :nationality, :string
    add_column :users, :attached_id, :string
    add_column :users, :sha, :integer
    add_column :users, :marital_status, :string
    add_column :users, :occupation, :string
    add_column :users, :employer_name, :string
    add_column :users, :attached_kra, :string
    add_column :users, :postal_address, :string
    add_column :users, :home_address, :string
  end
end
