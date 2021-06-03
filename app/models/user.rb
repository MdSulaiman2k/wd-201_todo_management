class User < ApplicationRecord
  has_secure_password
  has_many :todos
  validates :firstname, presence: true
  validates :firstname, length: { minimum: 2 }
  validates :email, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 8 }
end
