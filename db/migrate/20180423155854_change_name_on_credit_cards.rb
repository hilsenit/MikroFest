class ChangeNameOnCreditCards < ActiveRecord::Migration[5.1]
  def change
    rename_column :credit_cards, :month, :exp_month
    rename_column :credit_cards, :year, :exp_year
  end
end
