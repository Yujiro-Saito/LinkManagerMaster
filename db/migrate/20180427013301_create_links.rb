class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :name
      t.text :url
      t.references :folder, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
