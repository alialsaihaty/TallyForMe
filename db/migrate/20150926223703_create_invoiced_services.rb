class CreateInvoicedServices < ActiveRecord::Migration
  def change
    create_table :invoiced_services do |t|
      t.references :service, index: true, foreign_key: true
      t.references :invoice, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
