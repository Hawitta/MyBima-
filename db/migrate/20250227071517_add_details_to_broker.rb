class AddDetailsToBroker < ActiveRecord::Migration[8.0]
  def change
    add_column :brokers, :trading_as, :string
    add_column :brokers, :pin_no, :string
    add_column :brokers, :email, :string
  end
end
