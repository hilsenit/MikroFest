class CreateTitles < ActiveRecord::Migration[5.1]
  def change
    create_table :titles do |t|
			t.string :title
			t.text :description
			t.string :image

      t.timestamps
    end
  end
end
