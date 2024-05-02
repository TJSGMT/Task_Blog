class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true,uniqueness: true
  validates :email, presence: true, uniqueness: true,format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_digest, presence: true, length: {minimum: 6}
end
