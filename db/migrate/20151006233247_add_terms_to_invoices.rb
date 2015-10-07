class AddTermsToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :terms, :string
  end
end
