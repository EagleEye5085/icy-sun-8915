require 'rails_helper'

RSpec.describe 'employee show' do
  before :each do
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


    visit "/employees/#{@employee_1.id}"
  end

  it 'shows employee name and department' do

    expect(page).to have_content("Thomas")
    expect(page).to have_content("Sales")
  end

  it 'lists tickets oldest to youngest' do

    expect(@ticket_2.subject).to appear_before(@ticket_4.subject)
    expect(@ticket_4.subject).to appear_before(@ticket_1.subject)
    expect(@ticket_1.subject).to appear_before(@ticket_3.subject)
  end

  it 'shows the oldest ticket' do

    expect(page).to have_content("Oldest ticket: sale_2")
  end

  it 'can add a ticket to employee' do

  expect(page).to_not have_content('sale_5')

  fill_in "subject", with: "sale_5"

  click_button "Add Ticket"

  expect(current_path).to eq("/employees/#{@employee_1.id}")

  expect(page).to have_content("sale_5")

  end

  it 'shows employee level' do

    expect(page).to have_content('Level: 3')
  end

  it 'shows employees with shared tickets' do
    expect(page).to have_content('Tyler')
  end
end
