require 'minitest/autorun'
require 'minitest/rg'
require_relative '../customer.rb'

class CustomerTest < MiniTest::Test
  def setup
    @customer1 = Customer.new({ "name" => "Ben Harvie", "funds" => "90" })
    @customer2 = Customer.new({ "name" => "Neiko Fraser", "funds" => "50" })
    @customer3 = Customer.new({ "name" => "Crash Bandicoot", "funds" => "30" })
  end

  def test_customer_has_funds
    assert_equal(90, @customer1.funds)
  end

  def test_customer_decreases_funds
    @customer1.buy_ticket("Step Brothers") #Costs '10'
    assert_equal(80, @customer1.funds)
  end
end
