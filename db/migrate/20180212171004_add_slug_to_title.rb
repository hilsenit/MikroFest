class AddSlugToTitle < ActiveRecord::Migration[5.1]
  def change
    add_column :titles, :slug, :string
		add_index :titles, :slug, unique: true
  end
end
