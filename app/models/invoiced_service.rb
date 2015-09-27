class InvoicedService < ActiveRecord::Base
  belongs_to :service
  belongs_to :invoice
end
