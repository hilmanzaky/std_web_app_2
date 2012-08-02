class AddSlugToHeaderLinks < ActiveRecord::Migration
  def change
    add_column :header_links, :slug, :string
    add_index :header_links, :slug, unique: true
  end
end
