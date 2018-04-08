class CreateMikrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :mikrograms do |t|
      t.string :title
      t.text :description
      t.references :publisher, foreign_key: true

      t.timestamps
    end
  end
end
