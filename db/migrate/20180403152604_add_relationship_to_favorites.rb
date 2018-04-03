class AddRelationshipToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_reference :favorites, :title, index: true
    add_foreign_key :favorites, :titles
  end
end
