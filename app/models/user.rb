class User < ApplicationRecord
  has_many :pets

  validates_presence_of :username, message: 'Must have username!'
  validates_uniqueness_of :username, message: 'Username already taken.'

  validates_presence_of :email, message: 'You need an email to continue'
  validates_uniqueness_of :email, message: 'This email is already being used'

  validates_presence_of :password

  has_secure_password
end
