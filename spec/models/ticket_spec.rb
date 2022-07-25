require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'relationships' do
    it { should have_many(:employees).through(:employee_tickets) }
  end

  it 'sorts tickets old to new' do
    @ticket_1 = Ticket.create!(subject: 'sale_1', age: 2)
    @ticket_2 = Ticket.create!(subject: 'sale_2', age: 4)
    @ticket_3 = Ticket.create!(subject: 'sale_3', age: 1)

    expect(Ticket.sort_old_new[0].subject).to eq('sale_2')
    expect(Ticket.sort_old_new[1].subject).to eq('sale_1')
    expect(Ticket.sort_old_new[2].subject).to eq('sale_3')
  end
end
