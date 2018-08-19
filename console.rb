require_relative 'models/customer'
require_relative 'models/film'
require_relative 'models/ticket'
require_relative 'models/screening'
require 'pry-byebug'

### CLEAR ALL TABLES

Ticket.delete_all
Customer.delete_all
Film.delete_all
#Screening.delete_all

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

ticket2 = Ticket.new({ "customer_id" => customer1.id, "film_id" => film2.id })
ticket2.save

ticket3 = Ticket.new({ "customer_id" => customer3.id, "film_id" => film3.id })
ticket3.save

### SCREENINGS

screening1 = Screening.new({ "show_time" => "13:10", "capacity" => "10", "film_id" => film1.id })
screening1.save

screening2 = Screening.new({ "show_time" => "16:20", "capacity" => "20", "film_id" => film2.id })
screening2.save

screening3 = Screening.new({ "show_time" => "20:45", "capacity" => "30", "film_id" => film3.id })
screening3.save

###

binding.pry
nil
