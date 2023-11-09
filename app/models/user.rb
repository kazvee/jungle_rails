class User < ApplicationRecord
  has_secure_password

  validates :password, length: { minimum: 6 }  
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end