class CreateArtworks < ActiveRecord::Migration[5.1]
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :image_url
      t.boolean :featured
      t.boolean :for_sale
      t.string :size
      t.decimal :price

      t.timestamps
    end
  end
end
