class CreateBookRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :book_relationships do |t|
      t.references :book, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
    # 同じタグは2回保存できない
    add_index :book_relationships,[:book_id,:tag_id],unique: true 
  end
end
