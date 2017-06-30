class AddPaperclipImageToPhotos < ActiveRecord::Migration[5.1]
  def change
    remove_column :photos, :image_url
    add_attachment :photos, :image
  end
end
