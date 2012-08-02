class AddHeaderLinkIdToInfos < ActiveRecord::Migration
  def change
    add_column :infos, :header_link_id, :integer
  end
end
