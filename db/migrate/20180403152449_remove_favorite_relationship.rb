class RemoveFavoriteRelationship < ActiveRecord::Migration[5.1]
  def change
    remove_column :favorites, :title_id
  end
end
