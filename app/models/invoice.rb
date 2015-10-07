class Invoice < ActiveRecord::Base

  has_many :invoiced_items, dependent: :destroy
  has_many :items, through: :invoiced_items

  has_many :invoiced_services, dependent: :destroy
  has_many :services, through: :invoiced_services

  belongs_to :company


  #scope :latest_first, lambda { order ("date DESC") }
  def self.latest_first
    order("created_at DESC")
  end
end
