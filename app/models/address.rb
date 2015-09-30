class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true

  validates :address1, presence: :true
end
