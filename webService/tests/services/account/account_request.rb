require 'net/http'
require 'nokogiri'
require "test/unit/assertions"
require 'cgi'

class AccountRequest
  include Test::Unit::Assertions

  def select_player_detail

    @host = "172.28.23.65"


### get jsessionId ##
  url = URI.parse('http://'+@host+'/LBO-2.14-promotions/cashier/showCashierMenu/promoGroupId/1/cardNumber/-1/allowedCardPrefixes/0367,0108?isUC=true')
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  }
  jsessionid = res['set-cookie'].split(/JSESSIONID=(\w+)/)[1]
  puts jsessionid



  path = "LBO-2.14-promotions/cashier/searchPlayerUC"
    url = URI('http://'+@host+'/'+path)

  request = Net::HTTP::Post.new(url)
  request.set_form_data({"username" => "07123123112" })
  request.add_field("Cookie", "JSESSIONID=#{jsessionid}")


  # request.each_header do |header_name, header_value|
  #   puts "#{header_name} : #{header_value}"
  # end

    response = Net::HTTP.new(url.host, url.port).start do |http|
      http.request(request)
    end

  html_doc = Nokogiri::HTML response.body
  node = html_doc.css('#results').to_s
    puts node
exit 1
  assert_equal(response.code.to_i,200)
  assert_includes(node,"Gruyere: Home")

  end

end
test = AccountRequest.new
test.select_player_detail