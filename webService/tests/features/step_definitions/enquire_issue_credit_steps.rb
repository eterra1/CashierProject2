require Dir.pwd+'/services/enquire_issue_credit'


enquire_issue_credit = EnquireIssueCredit.new



Given(/^A (\w+) machine  bar possition (\d+)$/) do |arg1,arg2|
  @enquire_issue_credit_error_result = enquire_issue_credit.bar_pos_request arg2
end

Then(/^I get a erro code (\d+)$/) do |arg1|
  expect(arg1).to eq @enquire_issue_credit_error_result
end

