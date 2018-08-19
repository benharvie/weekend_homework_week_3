require 'minitest/autorun'
require 'minitest/rg'
require_relative '../customer.rb'
require_relative '../film.rb'

class CustomerTest < MiniTest::Test
  def setup
    ### CUSTOMERS
    @customer1 = Customer.new({ "name" => "Ben Harvie", "funds" => "90" })
    @customer1.save

    @customer2 = Customer.new({ "name" => "Neiko Fraser", "funds" => "50" })
    @customer2.save

    @customer3 = Customer.new({ "name" => "Crash Bandicoot", "funds" => "30" })
    @customer3.save

    ### FILMS

    @film1 = Film.new({ "title" => "Step Brothers", "price" => "10" })
    @film1.save

    @film2 = Film.new({ "title" => "Enter The Matrix", "price" => "7" })
    @film2.save

    @film3 = Film.new({ "title" => "The 300", "price" => "4" })
    @film3.save

    ### TICKETS

    @ticket1 = Ticket.new({ "customer_id" => @customer1.id, "film_id" => @film1.id })
    @ticket1.save

    @ticket2 = Ticket.new({ "customer_id" => @customer1.id, "film_id" => @film2.id })
    @ticket2.save

    @ticket3 = Ticket.new({ "customer_id" => @customer3.id, "film_id" => @film3.id })
    @ticket3.save
  end

  def test_customer_has_funds
    assert_equal(90, @customer1.funds)
  end

  def test_customer_decreases_funds
    @customer1.buy_ticket(@film1) #Costs '10'
    assert_equal(80, @customer1.funds)
  end

  def test_tickets_bought_by_customer
    @customer2.buy_ticket(@film1)
    @customer2.buy_ticket(@film2)
    @customer2.buy_ticket(@film3)
    assert_equal(3, @customer2.tickets_bought)
  end
end
