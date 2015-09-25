class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: {message: "must be present"}, uniqueness: true,
             format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i



end
