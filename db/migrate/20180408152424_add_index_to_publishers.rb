class AddIndexToPublishers < ActiveRecord::Migration[5.1]
  def change
    add_index :publishers, :email,                unique: true
    add_index :publishers, :reset_password_token, unique: true
  end
end
