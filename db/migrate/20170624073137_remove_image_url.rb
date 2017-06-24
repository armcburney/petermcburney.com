class RemoveImageUrl < ActiveRecord::Migration[5.1]
  def change
    remove_column :artworks, :image_url
  end
end
