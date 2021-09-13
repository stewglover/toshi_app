class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.integer :journey_time
      t.datetime :delivery_due

      t.timestamps
    end
  end
end
