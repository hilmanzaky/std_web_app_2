class CreateHeaderLinks < ActiveRecord::Migration
  def change
    create_table :header_links do |t|
      t.string :name

      t.timestamps
    end
  end
end
