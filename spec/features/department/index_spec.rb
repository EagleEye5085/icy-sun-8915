require 'rails_helper'

RSpec.describe 'department index' do
  before :each do
    @department_1 = Department.create!(name: 'Sales', floor: 3)
    @department_2 = Department.create!(name: 'I.T.', floor: 2)

    @employee_1 = @department_1.employees.create!(name: 'Thomas', level: 3)
    @employee_2 = @department_1.employees.create!(name: 'Tyler', level: 2)
    @employee_3 = @department_2.employees.create!(name: 'Chris', level: 4)
    @employee_4 = @department_2.employees.create!(name: 'Billy', level: 1)

    visit '/departments'
  end

  it 'lists all departments' do

    expect(page).to have_content("Sales")
    expect(page).to have_content(3)
    expect(page).to have_content("I.T.")
    expect(page).to have_content(2)
  end

  it 'lists employees for the departments' do

    within "#department-#{@department_1.id}" do
      expect(page).to have_content("Thomas")
      expect(page).to have_content("Tyler")
    end

    within "#department-#{@department_2.id}" do
      expect(page).to have_content("Chris")
      expect(page).to have_content("Billy")
    end
  end

end
