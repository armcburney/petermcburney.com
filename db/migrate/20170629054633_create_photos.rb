class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :image_url
      t.boolean :featured
      t.string :image_type
      t.string :location

      t.timestamps
    end

    add_column :photos, :slug, :string
    add_index :photos, :slug, unique: true
  end
end
