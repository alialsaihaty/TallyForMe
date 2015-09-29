class AddCompanyReferencesToInvoices < ActiveRecord::Migration
  def change
    add_reference :invoices, :company, index: true, foreign_key: true
  end
end
