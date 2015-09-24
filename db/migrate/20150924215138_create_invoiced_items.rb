class CreateInvoicedItems < ActiveRecord::Migration
  def change
    create_table :invoiced_items do |t|
      t.references :invoice, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
