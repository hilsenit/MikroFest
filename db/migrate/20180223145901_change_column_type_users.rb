class ChangeColumnTypeUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :address, :string
  end
end
