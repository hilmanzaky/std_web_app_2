class AddSlugToInfos < ActiveRecord::Migration
  def change
    add_column :infos, :slug, :string
    add_index :infos, :slug, unique: true
  end
end
