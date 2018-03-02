class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :title, foreign_key: true
      t.string :written_by
      t.text :text
      t.string :url

      t.timestamps
    end
  end
end
