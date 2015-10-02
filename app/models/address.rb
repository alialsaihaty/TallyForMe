class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true

  validates :address1, presence: true
  validates :city,     presence: true
  validates :state,    presence: true
  validates :zip,      presence: true

end
