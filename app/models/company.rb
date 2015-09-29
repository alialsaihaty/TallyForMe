class Company < ActiveRecord::Base

  has_many :items, dependent: :destroy
  has_many :service, dependent: :destroy
  has_many :users, dependent: :nullify

  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :phones, as: :phonable, dependent: :destroy

end
