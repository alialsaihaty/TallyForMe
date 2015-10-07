class Item < ActiveRecord::Base

  has_many :invoiced_items, dependent: :destroy
  has_many :invoices, through: :invoiced_items

  belongs_to :company



end
