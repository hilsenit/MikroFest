class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.references :user, foreign_key: true
      t.integer :digits
      t.integer :month
      t.integer :year

      t.timestamps
    end
  end
end
