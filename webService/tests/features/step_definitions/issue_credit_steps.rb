require Dir.pwd+'/services/issue_credit'


issue_credit = IssueCredit.new

Given(/^Issue credit to machine using bar pos (\d+)$/) do |arg1|
  @issue_credit_error_result = issue_credit.insert_bar_pos arg1
end

Then(/^the issue credit result is (\d+)$/) do |arg1|
  expect(arg1).to eq @issue_credit_error_result
end
