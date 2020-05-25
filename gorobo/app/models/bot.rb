class Bot < ActiveRecord::Base
  has_many :builders
  has_many :builders, through: :builder_bots
end
