class User < ActiveRecord::Base

  has_secure_password

  has_many :addresses, as: :addressable, dependent: :destroy

  validates :email, presence: {message: "must be present"}, uniqueness: true,
             format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i



end
