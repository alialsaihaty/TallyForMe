class Client < ActiveRecord::Base
  belongs_to :company

  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :phones,    as: :phonable, dependent: :destroy
  has_many :emails,    as: :emailable, dependent: :destroy

  accepts_nested_attributes_for :addresses
end
