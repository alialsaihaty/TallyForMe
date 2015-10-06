class AddItemNameToItems < ActiveRecord::Migration
  def change
    add_column :items, :item_name, :string
  end
end
