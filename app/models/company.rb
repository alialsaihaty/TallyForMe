class Company < ActiveRecord::Base


  # belongs_to :user
  has_one :user

  has_many :items, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :clients, dependent: :nullify
  has_many :invoices, dependent: :destroy

  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :phones,    as: :phonable, dependent: :destroy
  has_many :emails,    as: :emailable, dependent: :destroy

  accepts_nested_attributes_for :addresses, reject_if: :all_blank
  accepts_nested_attributes_for :phones, reject_if: :all_blank
  accepts_nested_attributes_for :emails, reject_if: :all_blank

  validates :name,    presence: true
  validates :addresses, presence: true



end
