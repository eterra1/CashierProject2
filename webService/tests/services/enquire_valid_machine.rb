require 'savon'

class EnquireValidMachine

  def initialize
  ip = ENV['IP']

  @client = Savon.client(wsdl: Dir.pwd+'/../NEW_IEPOS.wsdl', endpoint: "http://172.28.23.#{ip}:15668/soap/IEPOS")
  end

  def insert_bar_pos barPos
	response = @client.call(:enquire_valid_machine, message: {version: '1.0',barposition: barPos})
	@result = response.to_hash[:multi_ref][:error_code]
	
  end

end