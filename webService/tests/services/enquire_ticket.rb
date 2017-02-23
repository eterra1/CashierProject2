require 'savon'
require Dir.pwd+'/helper/db'

class EnquireTicket

  def initialize

    ip = ENV['IP']
    read_titcket_data
    @client = Savon.client(wsdl: Dir.pwd+'/../NEW_IEPOS.wsdl', endpoint: "http://172.28.23.#{ip}:15668/soap/IEPOS")

  end

  def valid_ticket_bar_code
    response = @client.call(:enquire_ticket, message: {version: '1.0',ticketbarcode: @valid_ticket_bar_code,ticketref: ''})
    @valid_ticket_ref = response.to_hash[:multi_ref][0][:ticket_ref]
    @result = response.to_hash[:multi_ref][1][:error_code]
  end

  def valid_ticket_ref
    valid_ticket_bar_code
    response = @client.call(:enquire_ticket, message: {version: '1.0',ticketbarcode: '',ticketref: @valid_ticket_ref.to_s})
    @result = response.to_hash[:multi_ref][1][:error_code]
  end

  def redeemed_ticket_bar_code
    response = @client.call(:enquire_ticket, message: {version: '1.0',ticketbarcode: @redeemed_ticket_bar_code,ticketref: ''})
    @result = response.to_hash[:multi_ref][1][:error_code]
  end

  def insufficient_information
    response = @client.call(:enquire_ticket, message: {version: '1.0',ticketbarcode: '',ticketref: ''})
    @result = response.to_hash[:multi_ref][1][:error_code]
  end

  def redeemed_ticket_other_venue
    response = @client.call(:enquire_ticket, message: {version: '1.0',ticketbarcode: @redeemed_ticket_bar_code_different_venue,ticketref: ''})
    @result = response.to_hash[:multi_ref][1][:error_code]
  end

  def valid_ticket_other_venue
    response = @client.call(:enquire_ticket, message: {version: '1.0',ticketbarcode: @valid_ticket_bar_code_different_venue,ticketref: ''})
    @result = response.to_hash[:multi_ref][1][:error_code]
  end


end