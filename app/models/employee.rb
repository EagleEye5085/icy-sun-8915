class Employee < ApplicationRecord
  belongs_to :department
  has_many :employee_tickets, dependent: :destroy
  has_many :tickets, through: :employee_tickets

  def shared(id)
    # binding.pry
    employee = Employee.find(id)
    # select * from employees inner join employee_tickets on employee_tickets.employee_id = employees.id
    a =employee.tickets.map do |t|
        t.employees.map do |e|
          e.name
        end
      end.flatten.uniq
      a.delete(Employee.find(id).name)
      a
  end
end
