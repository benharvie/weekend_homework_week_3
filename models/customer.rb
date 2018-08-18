require_relative '../db/sql_runner'

class Customer
  attr_accessor :name, :funds
  attr_reader :id
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

###

  #Buying tickets should decrease the funds of the customer by the price
  def buy_ticket(film)
    sql = "SELECT price FROM films
          WHERE title = $1;"
    values = [film]
    film_cost = SqlRunner.run(sql, values)[0]["price"].to_i
    @funds -= film_cost
    update
  end

  def films
    sql = "SELECT films.*
    FROM films
    INNER JOIN tickets
    ON films.id = tickets.film_id
    WHERE tickets.customer_id = $1"
    values = [@id]
    SqlRunner.run(sql, values).map { |film_hash| Film.new(film_hash) }
  end

  ###

  def save
    sql = "INSERT INTO customers
    (name, funds)
    VALUES
    ($1, $2)
    RETURNING id"
    values = [@name, @funds]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update
    sql = "UPDATE customers
    SET (name, funds)
    =
    ($1, $2)
    WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM customers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  ###

  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end
end
