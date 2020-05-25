class BuilderBot < ActiveRecord::Base
  belongs_to :bot
  belongs_to :builder
end
