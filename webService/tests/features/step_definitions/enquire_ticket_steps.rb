require Dir.pwd+'/services/enquire_ticket'


enquire_ticket = EnquireTicket.new


Given(/^Enquire ([^"]*) ticket using (\w+)$/) do |arg1, arg2|
    if arg1 =="valid" and arg2 == "barCode"
      @enquire_ticket_error_result = enquire_ticket.valid_ticket_bar_code
      elsif arg1 == "valid" and arg2 == "ticketRef"
        @enquire_ticket_error_result = enquire_ticket.valid_ticket_ref
      elsif arg1 == "redeemed" and arg2 == "barCode"
         @enquire_ticket_error_result = enquire_ticket.redeemed_ticket_bar_code
      elsif arg1 == "noInfo" and arg2 == "noInfo"
        @enquire_ticket_error_result = enquire_ticket.insufficient_information
    end


end

Given(/^Enquire ([^"]*) ticket using barCode other venue$/) do |arg1|
  if arg1 =="valid"
    @enquire_ticket_error_result = enquire_ticket.valid_ticket_other_venue
  elsif arg1 == "redeemed"
    @enquire_ticket_error_result = enquire_ticket.redeemed_ticket_other_venue
  end
end

Then(/^the enquire ticket result is (\d+)$/) do |arg1|
  expect(arg1).to eq @enquire_ticket_error_result
end

