class AddUserIdToBroker < ActiveRecord::Migration[8.0]
  def change
    add_column :brokers, :user_id, :integer
  end
end
