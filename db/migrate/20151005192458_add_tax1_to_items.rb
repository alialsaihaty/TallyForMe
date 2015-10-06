class AddTax1ToItems < ActiveRecord::Migration
  def change
    add_column :items, :tax1, :integer
  end
end
