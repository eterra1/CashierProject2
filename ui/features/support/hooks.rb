require 'selenium-webdriver'

Before do

  case ENV['BROWSER']

    when 'chrome'
      @browser = Selenium::WebDriver.for :chrome ,driver_path: Dir.pwd+'/browsers/chromedriver.exe'

    when 'phantomjs'
      phantomjs_port = ENV['PHANTOMJS_PORT']
      @browser = Selenium::WebDriver.for(:remote, :url => "http://localhost:#{phantomjs_port}")

  end
  @browser.manage.window.maximize
end


After do |scenario|
  if scenario.failed? #take pic save , embed in report
    print path = @browser.current_url
    @browser.save_screenshot("report/#{scenario.__id__}.png")
    embed("report/#{scenario.__id__}.png", "image/png", "SCREENSHOT")
  end

  @browser.close

end