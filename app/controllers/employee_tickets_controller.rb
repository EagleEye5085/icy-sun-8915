class EmployeeTicketsController < ApplicationController

  def create
    EmployeeTicket.create!(employee_id: params[:id] ,ticket_id: Ticket.find_by(subject: params[:subject]).id)
    redirect_to "/employees/#{params[:id]}"
  end
end
