class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :invoice_number
      t.datetime :invoice_date
      t.float :subtotal
      t.integer :tax1
      t.integer :tax2
      t.boolean :is_paid
      t.string :payment_kind
      t.datetime :payment_date

      t.timestamps null: false
    end
  end
end
