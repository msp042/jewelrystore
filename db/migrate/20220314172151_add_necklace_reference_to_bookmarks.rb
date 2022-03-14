class AddNecklaceReferenceToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bookmarks, :necklaces
    add_index :bookmarks, :necklace_id
    change_column_null :bookmarks, :necklace_id, false
  end
end
