class Service < ActiveRecord::Base

  has_many :invoiced_services, dependent: :destroy
  has_many :invoices, through: :invoiced_services

  belongs_to :company

end
