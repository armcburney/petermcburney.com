class AddTypeColumn < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      CREATE TYPE artwork_type AS ENUM ('copic', 'painting', 'sketch');
    SQL

    add_column :artworks, :artwork_type, :artwork_type, index: true
  end

  def down
    remove_column :artworks, :artwork_type

    execute <<-SQL
      DROP TYPE artwork_type;
    SQL
  end
end
