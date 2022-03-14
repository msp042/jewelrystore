class AddCategoryReferenceToNecklaces < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :necklaces, :categories
    add_index :necklaces, :category_id
    change_column_null :necklaces, :category_id, false
  end
end
