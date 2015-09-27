class Invoice < ActiveRecord::Base

  has_many :invoiced_items, dependent: :destroy
  has_many :items, through: :invoiced_items

  has_many :invoiced_services, dependent: :destroy
  has_many :services, through: :invoiced_services
  
end
