class CreateBookRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :book_relationships do |t|
      t.references :book, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
