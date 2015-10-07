class AddPurchaseOrderNoToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :purchase_order_no, :string
  end
end
