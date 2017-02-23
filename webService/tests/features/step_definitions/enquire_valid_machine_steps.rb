require Dir.pwd+'/services/enquire_valid_machine'


enquire_valid_machine = EnquireValidMachine.new

Given(/^the machine bar pos ([^"]*)$/) do |arg1|
  @enquire_valid_machine_error_result = enquire_valid_machine.insert_bar_pos arg1
end

Then(/^the enquire machine result is (\d+)$/) do |arg1|
   expect(arg1).to eq @enquire_valid_machine_error_result


end
