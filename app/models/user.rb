class User < ApplicationRecord
  has_secure_password

  validates :password, length: { minimum: 6 }  
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.authenticate_with_credentials(email, password)
    sanitized_email = email.downcase.strip
    user = find_by('LOWER(email) = ?', sanitized_email)
    if user && user.authenticate(password)
      user
    else
      puts "Authentication failed. User: #{user.inspect}, Password: #{password}"
      nil
    end
  end
end