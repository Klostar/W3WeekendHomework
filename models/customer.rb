require_relative("../db/sql_runner.rb")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
  end

  def save()
    sql = "INSERT INTO customers(name,funds)
    VALUES($1,$2) RETURNING id"
    values =[@name,@funds]
    customer = SqlRunner.run( sql,values ).first
    @id = customer['id'].to_i

  end

  def update()
    sql = "UPDATE customers SET name = $1, funds = $2 WHERE id =$3"
    values =[@name,@funds,@id]
    SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values =[@id]
    SqlRunner.run(sql,values)
  end

  def films()
    sql = " SELECT films.*
            FROM films
            INNER JOIN tickets
            ON tickets.film_id = films.id
            WHERE tickets.customer_id = $1"
    values =[@id]
    films = SqlRunner.run(sql,values)
    result = films.map{|film| Film.new(film)}
    return result
  end


  def films_ticket()
    sql = " SELECT films.*
            FROM films
            INNER JOIN tickets
            ON tickets.film_id = films.id
            WHERE tickets.customer_id = $1"
    values =[@id]
    films = SqlRunner.run(sql,values)
    result = films.map{|film| Film.new(film)}.size
    return result
  end

  def pay(ticket_price)
    @funds -= ticket_price
  end

def self.all()
  sql = "SELECT * FROM customers"
  values =[]
  customers = SqlRunner.run(sql,values)
  result = customers.map{|customer| Customer.new(customer)}
  return result
end

def self.delete_all()
sql = "DELETE FROM customers"
values =[]
SqlRunner.run(sql,values)
end

end
