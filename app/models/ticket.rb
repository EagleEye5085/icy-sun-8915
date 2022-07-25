class Ticket < ApplicationRecord
  has_many :employee_tickets, dependent: :destroy
  has_many :employees, through: :employee_tickets

  def self.sort_old_new
    order(age: :desc)
  end
end
