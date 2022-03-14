class CreateNecklaces < ActiveRecord::Migration[6.0]
  def change
    create_table :necklaces do |t|
      t.integer :category_id
      t.string :title
      t.float :price
      t.string :image

      t.timestamps
    end
  end
end
