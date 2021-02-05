require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


use MealsController
use SessionsController
run ApplicationController
# this tells Rack to start the app. 
# we mount our controllers, and run ApplicationController. 