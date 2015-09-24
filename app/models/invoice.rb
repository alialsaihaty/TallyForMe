class Invoice < ActiveRecord::Base

  has_many :invoiced_items, dependent: :destroy
  has_many :items, through: :invoiced_items
end
