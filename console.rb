require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')

require('pry-byebug')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()


customer1 = Customer.new({'name' => 'Thomas Crawford', 'funds' => 50 })
customer1.save()
customer2 = Customer.new({'name' => 'Sam McPhearson', 'funds' => 70})
customer2.save()
customer3 = Customer.new({'name' => 'Zoe Alexander', 'funds' => 40})
customer3.save()
customer4 = Customer.new({'name' => 'Jonathan McCandles', 'funds' => 60})
customer4.save()
customer5 = Customer.new({'name' => 'David Smith', 'funds' => 40})
customer5.save()


film1 = Film.new({'title'=>'Ant Man and the Wasp', 'price' => 10})
film1.save()
film2 = Film.new({'title'=>'Mama Mia Here We Go Again', 'price' => 15})
film2.save()
film3 = Film.new({'title'=>'Incredibles 2', 'price' => 5})
film3.save()


ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id })
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id })
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film2.id })
ticket3.save()
ticket4 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film3.id })
ticket4.save()
ticket5 = Ticket.new({'customer_id' => customer5.id, 'film_id' => film2.id })
ticket5.save()

binding.pry
nil
