require './db.rb'
require './customer.rb'
require './book.rb'
require './controllers.rb'
require './views.rb'

$DB = DB.new

puts ' ====================='
puts '  Welcome to Library'
puts ' ====================='
puts ' type "help" for commands'

Controllers.router