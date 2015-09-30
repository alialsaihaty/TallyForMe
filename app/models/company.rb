class Company < ActiveRecord::Base



  has_many :items, dependent: :destroy
  has_many :service, dependent: :destroy
  has_many :users, dependent: :nullify

  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :phones, as: :phonable, dependent: :destroy

  accepts_nested_attributes_for :addresses, reject_if: :all_blank
  accepts_nested_attributes_for :phones, reject_if: :all_blank

  validates :name, presence: :true
  validates :email, presence: :true

end
