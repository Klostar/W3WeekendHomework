require_relative('../db/sql_runner.rb')

class Ticket

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
      sql = "INSERT INTO tickets(customer_id,film_id)
             VALUES($1,$2) RETURNING id"
      values =[@customer_id,@film_id]
      ticket = SqlRunner.run(sql,values).first
      @id = ticket['id'].to_i

  end

  def customers()
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [@customer_id]
    customer = SqlRunner.run(sql,values).first
    return Customer.new(customer)

  end


  def films()
    sql = "SELECT * FROM films WHERE id = $1"
    values = [@film_id]
    film = SqlRunner.run(sql,values).first
    return Film.new(film)
  end

  def update()
    sql = "UPDATE tickets SET customer_id = $1, film_id = $2 WHERE id =$3"
    values =[@customer_id,@film_id,@id]
    SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = $1"
    values =[@id]
    SqlRunner.run(sql,values)
  end

def self.all()
  sql = "SELECT * FROM tickets"
  values =[]
  tickets = SqlRunner.run(sql,values)
  result = tickets.map{|ticket|Ticket.new(ticket)}
  return result
end

def self.delete_all()
sql = "DELETE FROM tickets"
values =[]
SqlRunner.run(sql,values)
end


end
