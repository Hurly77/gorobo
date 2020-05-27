class Builder < ActiveRecord::Base
  has_many :bots
  has_secure_password
  validates :user_name, :email, presence: true,  uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, confirmation: true
end
