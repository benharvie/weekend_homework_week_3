require_relative '../db/sql_runner'

class Screening
  attr_reader :id
  attr_accessor :show_time, :capacity, :film_id
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @show_time = options['show_time']
    @capacity = options['capacity'].to_i
    @film_id = options['film_id'].to_i
  end

  ###

  def save
    sql = "INSERT INTO screenings
    (show_time, capacity, film_id)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@show_time, @capacity, @film_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update
    sql = "UPDATE screenings
    SET (show_time, capacity, film_id)
    =
    ($1, $2, $3)
    WHERE id = $4"
    values = [@show_time, @capacity, @film_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM screenings
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  ###

  def self.delete_all
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end
end
