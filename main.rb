require './customer.rb'
require './book.rb'
require './controllers.rb'
require './views.rb'

puts ' ====================='
puts '  Welcome to Library'
puts ' ====================='

puts ' please, set data source: 1, 2 ,3'
source = Views.wait_command
$DB = if source == '1'
		require './db1.rb'
		DB1.new
	  elsif source == '2'
	  	require './db2.rb'
	  	DB2.new
	  elsif source == '3'
	  	require './db3.rb'
	  	DB3.new
	  else
	  	puts 'Unknown datasource. Exiting'
	  	exit
	  end	
puts ' Data source selected'
puts ' ====================='
puts ' type "help" for commands'

Controllers.router