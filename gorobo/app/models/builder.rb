class Builder < ActiveRecord::Base
  has_many :bots
  has_many :bots, through: :builder_bots
  has_secure_password
  validates :user_name, :email, presence: true,  uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, confirmation: true
end
