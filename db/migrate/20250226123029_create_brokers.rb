class CreateBrokers < ActiveRecord::Migration[8.0]
  def change
    create_table :brokers do |t|
      t.string :broker_name
      t.string :unit_name
      t.string :signature

      t.timestamps
    end
  end
end
