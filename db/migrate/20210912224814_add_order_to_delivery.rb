class AddOrderToDelivery < ActiveRecord::Migration[6.1]
  def change
    add_reference :deliveries, :order, null: false, foreign_key: true
  end
end
