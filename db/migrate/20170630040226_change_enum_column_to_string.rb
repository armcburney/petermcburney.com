class ChangeEnumColumnToString < ActiveRecord::Migration[5.1]
  def change
    remove_column :artworks, :artwork_type

    execute <<-SQL
      DROP TYPE artwork_type;
    SQL

    add_column :artworks, :artwork_type, :string
  end
end
