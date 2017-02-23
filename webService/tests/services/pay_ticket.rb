require 'savon'
require Dir.pwd+'/helper/db'

class PayTicket

  def initialize

    ip = ENV['IP']
    @client = Savon.client(wsdl: Dir.pwd+'/../NEW_IEPOS.wsdl', endpoint: "http://172.28.23.#{ip}:15668/soap/IEPOS")

  end

  def valid_ticket

    read_titcket_data

    response = @client.call(:enquire_ticket, message: {version: '1.0',ticketbarcode: @valid_ticket_bar_code,ticketref: ''})
    @valid_ticket_ref = response.to_hash[:multi_ref][0][:ticket_ref]
    response = @client.call(:pay_ticket, message: {version: '1.0',ticketref: @valid_ticket_ref.to_s})
    @result = response.to_hash[:multi_ref][1][:error_code]

  end

  def invalid_ticket

    response = @client.call(:pay_ticket, message: {version: '1.0',ticketref: 'aaaa aaaa aaaa aaaa'})
    @result = response.to_hash[:multi_ref][1][:error_code]

  end

  def ticket_insufficient_information

    response = @client.call(:pay_ticket, message: {version: '1.0',ticketref: ''})
    @result = response.to_hash[:multi_ref][1][:error_code]

  end

  def redeemed_ticket

    read_titcket_data

    response = @client.call(:enquire_ticket, message: {version: '1.0',ticketbarcode: @redeemed_ticket_bar_code,ticketref: ''})
    @valid_ticket_ref = response.to_hash[:multi_ref][0][:ticket_ref]
    response = @client.call(:pay_ticket, message: {version: '1.0',ticketref: @valid_ticket_ref.to_s})
    @result = response.to_hash[:multi_ref][1][:error_code]

  end



end