class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  # belongs_to :company

  validates :address1, presence: true
  validates :city,     presence: true
  validates :state,    presence: true
  validates :zip,      presence: true

  def display
    "#{address1} #{city} #{state} #{country} #{zip}"
  end

end
