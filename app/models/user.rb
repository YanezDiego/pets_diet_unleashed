class User < ApplicationRecord
  has_many :pets

  validates_precence_of :username, message: 'Must have username!'
  validates_uniqueness_of :username, message: 'Username already taken.'

  validates_precence_of :email, message: 'You need an email to continue'
  validates_uniqueness_of :email, message: 'This email is already being used'

  validates_precence_of :password

  has_secure_password
end
