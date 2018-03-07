class AddPriceToTitles < ActiveRecord::Migration[5.1]
  def change
    add_column :titles, :price, :integer
  end
end
