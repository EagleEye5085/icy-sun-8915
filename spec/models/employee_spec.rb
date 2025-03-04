require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'relationships' do
    it { should belong_to :department }
    it { should have_many(:tickets).through(:employee_tickets) }
  end

  it 'can give names of shared employees' do
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

    expect(@employee_1.shared(@employee_1.id)).to eq(["Tyler"])
  end
end
