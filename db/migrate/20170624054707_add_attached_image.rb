class AddAttachedImage < ActiveRecord::Migration[5.1]
  def change
    add_attachment :artworks, :image
  end
end
