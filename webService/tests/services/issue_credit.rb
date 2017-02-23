require 'savon'

class IssueCredit

  def initialize
    ip = ENV['IP']

    @client = Savon.client(wsdl: Dir.pwd+'/../NEW_IEPOS.wsdl', endpoint: "http://172.28.23.#{ip}:15668/soap/IEPOS")

  end

    def insert_bar_pos arg
      response = @client.call(:issue_credit, message: {version: '1.0',barposition: arg,creditamount: '11'})
      @result = response.to_hash[:multi_ref][1][:error_code]
    end

end