class AddTax2ToItems < ActiveRecord::Migration
  def change
    add_column :items, :tax2, :integer
  end
end
