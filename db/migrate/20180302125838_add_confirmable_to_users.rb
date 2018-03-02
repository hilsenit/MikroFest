class AddConfirmableToUsers < ActiveRecord::Migration[5.1]
  def up
    change_table :users do |t|
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable
    end

    add_index :users, :confirmation_token, :unique => true
  end

  def self.down
    change_table :users do |t|
      t.remove :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email
    end

    remove_index :users, :confirmation_token
  end
end
