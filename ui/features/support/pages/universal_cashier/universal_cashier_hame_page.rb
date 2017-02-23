class UniversalCashierHomePage
  include PageObject
  #ip = ENV['IP']

  # page_url("http://www.jogo.pt")
  page_url("http://172.28.23.155:8080/ui/getUINew.do")

  # elements
  button(:sessiontagging ,     :css => "#sessiontagging")


  #erro pop up
  div(:error_popup,            :css => "#modalNew")
  button(:close_popup,         :css=>"#closePopup")


end