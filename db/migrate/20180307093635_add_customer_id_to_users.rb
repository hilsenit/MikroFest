class AddCustomerIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :customer_id, :bigint
  end
end