class AddFavoriteWordToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :favorite_word, :string
  end
end
