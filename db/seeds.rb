# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@department_1 = Department.create!(name: 'Sales', floor: 3)
@department_2 = Department.create!(name: 'I.T.', floor: 2)

@employee_1 = @department_1.employees.create!(name: 'Thomas', level: 3)
@employee_2 = @department_1.employees.create!(name: 'Tyler', level: 2)
@employee_3 = @department_2.employees.create!(name: 'Chris', level: 4)
@employee_4 = @department_2.employees.create!(name: 'Billy', level: 1)

@ticket_1 = Ticket.create!(subject: 'sale_1', age: 2)
@ticket_2 = Ticket.create!(subject: 'sale_2', age: 4)
@ticket_3 = Ticket.create!(subject: 'sale_3', age: 1)
@ticket_4 = Ticket.create!(subject: 'sale_4', age: 3)
@ticket_5 = Ticket.create!(subject: 'sale_5', age: 1)
@ticket_6 = Ticket.create!(subject: 'it_1', age: 1)

EmployeeTicket.create!(employee_id: @employee_1.id, ticket_id: @ticket_1.id)
EmployeeTicket.create!(employee_id: @employee_1.id, ticket_id: @ticket_2.id)
EmployeeTicket.create!(employee_id: @employee_1.id, ticket_id: @ticket_3.id)
EmployeeTicket.create!(employee_id: @employee_1.id, ticket_id: @ticket_4.id)
EmployeeTicket.create!(employee_id: @employee_2.id, ticket_id: @ticket_4.id)
EmployeeTicket.create!(employee_id: @employee_3.id, ticket_id: @ticket_6.id)
