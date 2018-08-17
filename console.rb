require_relative 'models/customer'
require_relative 'models/film'
require_relative 'models/ticket'
require 'pry-byebug'

customer1 = Customer.new({"name" => "Ben Harvie", "funds" => "90"})
customer1.save

customer2 = Customer.new({"name" => "Neiko Fraser", "funds" => "50"})
customer2.save

customer3 = Customer.new({"name" => "Crash Bandicoot", "funds" => "30"})
customer3.save

binding.pry
nil
