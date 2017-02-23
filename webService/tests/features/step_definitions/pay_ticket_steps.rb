require Dir.pwd+'/services/pay_ticket'


pay_ticket = PayTicket.new


Given(/^Pay ([^"]*) ticket$/) do |arg1|
  if arg1 =="valid"
    @pay_ticket_error_result = pay_ticket.valid_ticket
  elsif arg1 == "invalid"
    @pay_ticket_error_result = pay_ticket.invalid_ticket
  elsif arg1 == "redeemed"
    @pay_ticket_error_result = pay_ticket.redeemed_ticket
  elsif arg1 == "noInfo"
    @pay_ticket_error_result = pay_ticket.ticket_insufficient_information
  end


end

Then(/^the pay ticket result is (\d+)$/) do |arg1|
  expect(arg1).to eq @pay_ticket_error_result
end
