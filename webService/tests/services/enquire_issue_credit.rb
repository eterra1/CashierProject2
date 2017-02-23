require 'savon'

 class EnquireIssueCredit

  def initialize
    ip = ENV['IP']
    # @bar_pos = ENV['barPos']

    @client = Savon.client(wsdl: Dir.pwd+'/../NEW_IEPOS.wsdl', endpoint: "http://172.28.23.#{ip}:15668/soap/IEPOS")
  end

  def bar_pos_request barPos
    response = @client.call(:enquire_issue_credit, message: {version: '1.0',barposition: barPos,creditamount: '11'})
    @result = response.to_hash[:multi_ref][:error_code]

  end

  end