class AddMediaToArtworks < ActiveRecord::Migration[5.1]
  def change
    add_column :artworks, :media, :string, null: false, default: ''
  end
end
