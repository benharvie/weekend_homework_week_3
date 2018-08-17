require_relative 'models/customer'
require_relative 'models/film'
require_relative 'models/ticket'
require 'pry-byebug'

Ticket.delete_all
Customer.delete_all
Film.delete_all

### CUSTOMERS

customer1 = Customer.new({ "name" => "Ben Harvie", "funds" => "90" })
customer1.save

customer2 = Customer.new({ "name" => "Neiko Fraser", "funds" => "50" })
customer2.save

customer3 = Customer.new({ "name" => "Crash Bandicoot", "funds" => "30" })
customer3.save

### FILMS

film1 = Film.new({ "title" => "Step Brothers", "price" => "10" })
film1.save

film2 = Film.new({ "title" => "Enter The Matrix", "price" => "7" })
film2.save

film3 = Film.new({ "title" => "The 300", "price" => "4" })
film3.save

### TICKETS

ticket1 = Ticket.new({ "customer_id" => customer1.id, "film_id" => film1.id })
ticket1.save

ticket2 = Ticket.new({ "customer_id" => customer2.id, "film_id" => film2.id })
ticket2.save

ticket3 = Ticket.new({ "customer_id" => customer3.id, "film_id" => film3.id })
ticket3.save

###

binding.pry
nil
