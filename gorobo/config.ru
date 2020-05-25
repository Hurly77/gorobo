require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
#This line will let help browser send patch and, delete http request to server.
#help us run our controllers.
use Rack::MethodOverride 
run ApplicationController
use BuilderBotsController
use BotsController
use BuildersController
